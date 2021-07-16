import 'dart:collection';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealup_restaurant_side/config/Palette.dart';
import 'package:mealup_restaurant_side/constant/app_strings.dart';
import 'package:mealup_restaurant_side/constant/common_function.dart';
import 'package:mealup_restaurant_side/localization/localization_constant.dart';
import 'package:mealup_restaurant_side/models/common_response.dart';
import 'package:mealup_restaurant_side/models/orders_response.dart';
import 'package:mealup_restaurant_side/retrofit/base_model.dart';
import 'package:mealup_restaurant_side/screens/orders/OrderDetailScreen.dart';
import 'package:mealup_restaurant_side/utilities/prefConstatnt.dart';
import 'package:mealup_restaurant_side/utilities/preference.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Future<BaseModel<OrdersResponse>> getOrderFuture;
List<Data> orderList = [];
List<Data> _searchResult = [];
TextEditingController searchController = new TextEditingController();

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController controllerTab;
  int selectedIndex = 0;
  List<Tab> myTabs = [];

  @override
  void initState() {
    super.initState();
    getOrderFuture = getOrders();
  }

  @override
  void didChangeDependencies() {
    myTabs = <Tab>[
      Tab(
        child: Text(
          getTranslated(context, new_orders),
        ),
      ),
      Tab(
        child: Text(
          getTranslated(context, past_orders),
        ),
      ),
    ];
    controllerTab = TabController(length: myTabs.length, vsync: this);
    controllerTab.addListener(() {
      setState(() {
        selectedIndex = controllerTab.index;
      });
    });    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          getTranslated(context, orders),
          //'Orders ${getTranslated(context, no_internet)}',
          style: TextStyle(fontFamily: "ProximaBold", color: Palette.loginhead),
        ),
        bottom: TabBar(
          isScrollable: true,
          controller: controllerTab,
          unselectedLabelColor: Colors.black,
          indicatorColor: Palette.green,
          labelColor: Colors.black,
          indicatorWeight: 5,
          unselectedLabelStyle:
              TextStyle(fontSize: 18, fontFamily: proxima_nova_reg),
          labelStyle: TextStyle(fontSize: 18, fontFamily: proxima_nova_bold),
          tabs: myTabs,
        ),
      ),
      body: //GestureDetector(
          // onTap: () {FocusScope.of(context).requestFocus(new FocusNode());},
          // child:
          Container(
        width: width,
        height: height,
        margin: EdgeInsets.all(10),
        child: _tabBar(),
      ),
      // ),
    );
  }

  _tabBar() => TabBarView(controller: controllerTab, children: [
        FutureBuilder<BaseModel<OrdersResponse>>(
          future: getOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.done) {
                return newOrderList(context, snapshot.data.data.data);
              } else {
                return CommonFunction.showProgress(true);
              }
            } else {
              return CommonFunction.showProgress(true);
            }
          },
        ),
        Wrap(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(50),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70.w,
                          child: TextField(
                            controller: searchController,
                            onChanged: onSearchTextChanged,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search Order ID or Username...',
                                hintStyle: TextStyle(
                                    color: Palette.switchs,
                                    fontSize: 13,
                                    fontFamily: proxima_nova_reg)),
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  /* Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(50),
                            spreadRadius: 1,
                            blurRadius: 1,
                          )
                        ]),
                    child: SvgPicture.asset('assets/images/filter.svg'),
                  ),*/
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              child: FutureBuilder<BaseModel<OrdersResponse>>(
                future: getOrderFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      orderList.clear();
                      orderList.addAll(snapshot.data.data.data);
                      return newOrderListPast(context);
                    } else {
                      return CommonFunction.showProgress(true);
                    }
                  } else {
                    return CommonFunction.showProgress(true);
                  }
                },
              ),
            ),
          ],
        ),
      ]);

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    orderList.forEach((oderListDetail) {
      if (oderListDetail.userName.contains(text) ||
          oderListDetail.orderId.contains(text))
        _searchResult.add(oderListDetail);
    });

    setState(() {});
  }

  newOrderList(BuildContext context, List<Data> data) => ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          String dropdownValue = data[index].orderStatus;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(data[index]),
                  ));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white24, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "OID:",
                                style: TextStyle(
                                    color: Palette.switchs,
                                    fontFamily: proxima_nova_reg,
                                    fontSize: 12),
                              ),
                              Text(
                                data[index].orderId,
                                style: TextStyle(
                                    color: Palette.switchs,
                                    fontFamily: proxima_nova_reg,
                                    fontSize: 12),
                              ),
                              Text(
                                " | ",
                                style: TextStyle(
                                    color: Palette.switchs,
                                    fontFamily: proxima_nova_reg,
                                    fontSize: 12),
                              ),
                              Text(
                                '${data[index].date}, ${data[index].time}',
                                style: TextStyle(
                                    color: Palette.switchs,
                                    fontFamily: proxima_nova_reg,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index].userName,
                                style: TextStyle(
                                    color: Palette.loginhead,
                                    fontFamily: proxima_nova_bold,
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Palette.loginhead,
                                size: 35,
                              )
                            ],
                          ),
                        ],
                      )),
                  DottedLine(
                    direction: Axis.horizontal,
                    lineThickness: 1.0,
                    dashColor: Palette.switchs,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    child: ListView.builder(
                      itemCount: data[index].orderItems.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index1) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    data[index].orderItems[index1].itemName,
                                    style: TextStyle(
                                        color: Palette.loginhead,
                                        fontFamily: "ProximaNova",
                                        fontSize: 14),
                                  ),
                                  Text(
                                    ' x ${data[index].orderItems[index1].qty}',
                                    style: TextStyle(
                                        color: Palette.green,
                                        fontFamily: "ProximaBold",
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Visibility(
                                child: Text(
                                  '(${data[index].orderItems[index1].itemName})',
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: "ProximaNova",
                                      fontSize: 12),
                                ),
                                visible: false,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    lineThickness: 1.0,
                    dashColor: Palette.switchs,
                  ),
                  Container(
                    width: 100.w,
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 30.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index].paymentType,
                                style: TextStyle(
                                    color: Palette.switchs,
                                    fontFamily: proxima_nova_reg,
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${SharedPreferenceHelper.getString(Preferences.currency_symbol)} ${data[index].amount}',
                                style: TextStyle(
                                    color: Palette.loginhead,
                                    fontFamily: proxima_nova_bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Stack(children: [
                          Positioned(
                            child: Container(
                              width: 20.w,
                              child: DropdownButton(
                                  //value: dropdownValue ,
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Palette.loginhead,
                                    size: 20,
                                  ),
                                  iconSize: 30,
                                  elevation: 16,
                                  isDense: true,
                                  style: TextStyle(
                                      color: Palette.green,
                                      fontFamily: proxima_nova_bold,
                                      fontSize: 12),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                      Map<String, String> param = new HashMap();
                                      param['id'] = data[index].id.toString();
                                      param['status'] = dropdownValue;
                                      FutureBuilder<BaseModel<CommonResponse>>(
                                        future: changeOrderStatus(param),
                                        builder: (context, snapshot) {
                                          CommonFunction.toastMessage(
                                              'before connection ');
                                          if (snapshot.connectionState !=
                                              ConnectionState.done) {
                                            return CommonFunction.showProgress(
                                                true);
                                          } else {
                                            print('${snapshot.data.data}');
                                            var data = snapshot.data.data;
                                            print(data);
                                            setState(() {});
                                            if (data != null) {
                                              return Container(
                                                child:
                                                    CommonFunction.toastMessage(
                                                        data.data.toString()),
                                              );
                                            } else {
                                              return Container(
                                                  child:
                                                      CommonFunction.toastMessage(
                                                          data.data.toString()));
                                            }
                                          }
                                        },
                                      );
                                      // selectedItemId = snapshot.data.data.data[snapshot.data.data.data.indexOf(newValue)].id;
                                      // print('value ${newValue.name} $selectedItemId');
                                    });
                                  },
                                  items: data[index].deliveryType == 'SHOP'
                                      ? <String>[
                                            'Pending',
                                            'Approve',
                                            'Reject',
                                            'PREPARE_FOR_ORDER',
                                            'READY_FOR_ORDER',
                                            'COMPLETE'
                                          ].map((item) {
                                            //print('value ${item.name} ');
                                            return new DropdownMenuItem<String>(
                                              child: Text(item),
                                              value: item,
                                            );
                                          }).toList() ??
                                          []
                                      : <String>[
                                            'Pending',
                                            'Approve',
                                            'Reject',
                                            'PICKUP',
                                            'DELIVERED',
                                            'COMPLETE'
                                          ].map((item) {
                                            //print('value ${item.name} ');
                                            return new DropdownMenuItem<String>(
                                              child: Text(item),
                                              value: item,
                                            );
                                          }).toList() ??
                                          []),
                            ),
                            right: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 20),
                            child: Text(
                              dropdownValue,
                              style: TextStyle(
                                  color: Palette.green,
                                  fontFamily: proxima_nova_bold,
                                  fontSize: 12),
                              textAlign: TextAlign.end,
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );

  newOrderListPast(BuildContext context) => _searchResult.length != 0 ||
          searchController.text.isNotEmpty
      ? ListView.builder(
          itemCount: _searchResult.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            String dropdownValue = _searchResult[index].orderStatus;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrderDetailScreen(_searchResult[index]),
                    ));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white24, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "OID:",
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 12),
                                ),
                                Text(
                                  _searchResult[index].orderId,
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 12),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 12),
                                ),
                                Text(
                                  '${_searchResult[index].date}, ${_searchResult[index].time}',
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _searchResult[index].userName,
                                  style: TextStyle(
                                      color: Palette.loginhead,
                                      fontFamily: proxima_nova_bold,
                                      fontSize: 16),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Palette.loginhead,
                                  size: 35,
                                )
                              ],
                            ),
                          ],
                        )),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineThickness: 1.0,
                      dashColor: Palette.switchs,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 10),
                      child: ListView.builder(
                        itemCount: _searchResult[index].orderItems.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index1) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      _searchResult[index]
                                          .orderItems[index1]
                                          .itemName,
                                      style: TextStyle(
                                          color: Palette.loginhead,
                                          fontFamily: "ProximaNova",
                                          fontSize: 14),
                                    ),
                                    Text(
                                      ' x ${_searchResult[index].orderItems[index1].qty}',
                                      style: TextStyle(
                                          color: Palette.green,
                                          fontFamily: "ProximaBold",
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  child: Text(
                                    '(${_searchResult[index].orderItems[index1].itemName})',
                                    style: TextStyle(
                                        color: Palette.switchs,
                                        fontFamily: "ProximaNova",
                                        fontSize: 12),
                                  ),
                                  visible: false,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineThickness: 1.0,
                      dashColor: Palette.switchs,
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _searchResult[index].paymentType,
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$${_searchResult[index].amount}',
                                  style: TextStyle(
                                      color: Palette.loginhead,
                                      fontFamily: proxima_nova_bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Stack(children: [
                            Container(
                              width: 20.w,
                              child: DropdownButton(
                                  //value: dropdownValue ,
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Palette.loginhead,
                                    size: 20,
                                  ),
                                  iconSize: 30,
                                  elevation: 16,
                                  isDense: true,
                                  style: TextStyle(
                                      color: Palette.green,
                                      fontFamily: proxima_nova_bold,
                                      fontSize: 12),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                      Map<String, String> param = new HashMap();
                                      param['id'] =
                                          _searchResult[index].id.toString();
                                      param['status'] = dropdownValue;
                                      FutureBuilder<BaseModel<CommonResponse>>(
                                        future: changeOrderStatus(param),
                                        builder: (context, snapshot) {
                                          CommonFunction.toastMessage(
                                              'before connection ');
                                          if (snapshot.connectionState !=
                                              ConnectionState.done) {
                                            return CommonFunction.showProgress(
                                                true);
                                          } else {
                                            print('${snapshot.data.data}');
                                            var data = snapshot.data.data;
                                            print(data);
                                            setState(() {});
                                            if (data != null) {
                                              return Container(
                                                child:
                                                    CommonFunction.toastMessage(
                                                        data.data.toString()),
                                              );
                                            } else {
                                              return Container(
                                                  child: CommonFunction
                                                      .toastMessage(data.data
                                                          .toString()));
                                            }
                                          }
                                        },
                                      );
                                      // selectedItemId = snapshot.data.data.data[snapshot.data.data.data.indexOf(newValue)].id;
                                      // print('value ${newValue.name} $selectedItemId');
                                    });
                                  },
                                  items: _searchResult[index].deliveryType ==
                                          'SHOP'
                                      ? <String>[
                                            'Pending',
                                            'Approve',
                                            'Reject',
                                            'PREPARE_FOR_ORDER',
                                            'READY_FOR_ORDER',
                                            'COMPLETE'
                                          ].map((item) {
                                            //print('value ${item.name} ');
                                            return new DropdownMenuItem<String>(
                                              child: Text(item),
                                              value: item,
                                            );
                                          }).toList() ??
                                          []
                                      : <String>[
                                            'Pending',
                                            'Approve',
                                            'Reject',
                                            'PICKUP',
                                            'DELIVERED',
                                            'COMPLETE'
                                          ].map((item) {
                                            //print('value ${item.name} ');
                                            return new DropdownMenuItem<String>(
                                              child: Text(item),
                                              value: item,
                                            );
                                          }).toList() ??
                                          []),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 5),
                              child: Text(
                                dropdownValue,
                                style: TextStyle(
                                    color: Palette.green,
                                    fontFamily: proxima_nova_bold,
                                    fontSize: 12),
                                textAlign: TextAlign.end,
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
      : ListView.builder(
          itemCount: orderList.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 10),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            String dropdownValue = orderList[index].orderStatus;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailScreen(orderList[index]),
                    ));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white24, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "OID:",
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 12),
                                ),
                                Text(
                                  orderList[index].orderId,
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 12),
                                ),
                                Text(
                                  " | ",
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 12),
                                ),
                                Text(
                                  '${orderList[index].date}, ${orderList[index].time}',
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  orderList[index].userName,
                                  style: TextStyle(
                                      color: Palette.loginhead,
                                      fontFamily: proxima_nova_bold,
                                      fontSize: 16),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: Palette.loginhead,
                                  size: 35,
                                )
                              ],
                            ),
                          ],
                        )),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineThickness: 1.0,
                      dashColor: Palette.switchs,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 10),
                      child: ListView.builder(
                        itemCount: orderList[index].orderItems.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index1) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      orderList[index]
                                          .orderItems[index1]
                                          .itemName,
                                      style: TextStyle(
                                          color: Palette.loginhead,
                                          fontFamily: "ProximaNova",
                                          fontSize: 14),
                                    ),
                                    Text(
                                      ' x ${orderList[index].orderItems[index1].qty}',
                                      style: TextStyle(
                                          color: Palette.green,
                                          fontFamily: "ProximaBold",
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  child: Text(
                                    '(${orderList[index].orderItems[index1].itemName})',
                                    style: TextStyle(
                                        color: Palette.switchs,
                                        fontFamily: "ProximaNova",
                                        fontSize: 12),
                                  ),
                                  visible: false,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineThickness: 1.0,
                      dashColor: Palette.switchs,
                    ),
                    Container(
                      width: 100.w,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderList[index].paymentType,
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: proxima_nova_reg,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$${orderList[index].amount}',
                                  style: TextStyle(
                                      color: Palette.loginhead,
                                      fontFamily: proxima_nova_bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Stack(children: [
                            Container(
                              width: 20.w,
                              child: DropdownButton(
                                  //value: dropdownValue ,
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Palette.loginhead,
                                    size: 20,
                                  ),
                                  iconSize: 30,
                                  elevation: 16,
                                  isDense: true,
                                  style: TextStyle(
                                      color: Palette.green,
                                      fontFamily: proxima_nova_bold,
                                      fontSize: 12),
                                  onChanged: (newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                      Map<String, String> param = new HashMap();
                                      param['id'] =
                                          orderList[index].id.toString();
                                      param['status'] = dropdownValue;
                                      FutureBuilder<BaseModel<CommonResponse>>(
                                        future: changeOrderStatus(param),
                                        builder: (context, snapshot) {
                                          CommonFunction.toastMessage(
                                              'before connection ');
                                          if (snapshot.connectionState !=
                                              ConnectionState.done) {
                                            return CommonFunction.showProgress(
                                                true);
                                          } else {
                                            print('${snapshot.data.data}');
                                            var data = snapshot.data.data;
                                            print(data);
                                            setState(() {});
                                            if (data != null) {
                                              return Container(
                                                child:
                                                    CommonFunction.toastMessage(
                                                        data.data.toString()),
                                              );
                                            } else {
                                              return Container(
                                                  child: CommonFunction
                                                      .toastMessage(data.data
                                                          .toString()));
                                            }
                                          }
                                        },
                                      );
                                      // selectedItemId = snapshot.data.data.data[snapshot.data.data.data.indexOf(newValue)].id;
                                      // print('value ${newValue.name} $selectedItemId');
                                    });
                                  },
                                  items: orderList[index].deliveryType == 'SHOP'
                                      ? <String>[
                                            'Pending',
                                            'Approve',
                                            'Reject',
                                            'PREPARE_FOR_ORDER',
                                            'READY_FOR_ORDER',
                                            'COMPLETE'
                                          ].map((item) {
                                            //print('value ${item.name} ');
                                            return new DropdownMenuItem<String>(
                                              child: Text(item),
                                              value: item,
                                            );
                                          }).toList() ??
                                          []
                                      : <String>[
                                            'Pending',
                                            'Approve',
                                            'Reject',
                                            'PICKUP',
                                            'DELIVERED',
                                            'COMPLETE'
                                          ].map((item) {
                                            //print('value ${item.name} ');
                                            return new DropdownMenuItem<String>(
                                              child: Text(item),
                                              value: item,
                                            );
                                          }).toList() ??
                                          []),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, right: 5),
                              child: Text(
                                dropdownValue,
                                style: TextStyle(
                                    color: Palette.green,
                                    fontFamily: proxima_nova_bold,
                                    fontSize: 12),
                                textAlign: TextAlign.end,
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
}
