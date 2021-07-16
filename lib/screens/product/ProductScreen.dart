import 'dart:collection';
import 'dart:convert';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealup_restaurant_side/config/Palette.dart';
import 'package:mealup_restaurant_side/constant/app_strings.dart';
import 'package:mealup_restaurant_side/constant/common_function.dart';
import 'package:mealup_restaurant_side/localization/localization_constant.dart';
import 'package:mealup_restaurant_side/models/common_response.dart';
import 'package:mealup_restaurant_side/models/menu.dart';
import 'package:mealup_restaurant_side/models/product_customization_response.dart';
import 'package:mealup_restaurant_side/models/product_response.dart';
import 'package:mealup_restaurant_side/retrofit/base_model.dart';
import 'package:mealup_restaurant_side/screens/product/AddNewProduct.dart';
import 'package:sizer/sizer.dart';

import 'AddNewItem.dart';
import 'customeTabView.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  // TabController controllerTab = TabController();
  int selectedIndex = 0;
  int initPosition = 1;
  Future<BaseModel<Menu>> menuFuture;

  @override
  void initState() {
    super.initState();
    menuFuture = getMenu();
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
          getTranslated(context, my_products),
          style: TextStyle(
              fontFamily: proxima_nova_bold, color: Palette.loginhead),
        ),
        /* bottom: TabBar(
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
        ),*/
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /*IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Palette.loginhead,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductSearchScreen()));
                  },
                ),*/
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Palette.loginhead,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddNewProduct()));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
          width: width,
          height: height,
          margin: EdgeInsets.all(10),
          child: FutureBuilder<BaseModel<Menu>>(
            future: menuFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CommonFunction.showProgress(true);
              } else {
                var data = snapshot.data.data;
                return data.data.length > 1
                    ? CustomTabView(
                        initPosition: initPosition,
                        itemCount: data.data.length,
                        tabBuilder: (context, index) =>
                            Tab(text: data.data[index].name),
                        pageBuilder: (context, index) =>
                            _productList(data.data[index].id),
                        onPositionChange: (index) {
                          print('current position: $index');
                          initPosition = index;
                        },
                        onScroll: (position) => print('$position'),
                      )
                    : Container();
              }
            },
          )),
    );
  }

  _productList(int id) {
    AdvancedSwitchController _controller = AdvancedSwitchController();
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        height: 100.h,
        width: 100.w,
        child: Container(
          child: FutureBuilder<BaseModel<ProductResponse>>(
            future: getProduct(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.connectionState != ConnectionState.waiting) {
                  var data = snapshot.data.data;
                  return data.productData.length > 0
                      ? ListView.builder(
                          itemCount: data.productData.length,
                          itemBuilder: (context, index) {
                            _controller = data.productData[index].status == 1
                                ? AdvancedSwitchController(true)
                                : AdvancedSwitchController(false);
                            _controller.addListener(() {
                              if (data.productData[index].status == 1) {
                                Map<String, String> param = new HashMap();
                                param['menu_id'] =
                                    data.productData[index].menuId.toString();
                                param['name'] =
                                    data.productData[index].name.toString();
                                param['description'] = data
                                    .productData[index].description
                                    .toString();
                                param['type'] =
                                    data.productData[index].type.toString();
                                param['qty_reset'] =
                                    data.productData[index].qtyReset.toString();
                                param['price'] =
                                    data.productData[index].price.toString();
                                param['status'] = '0';
                                param['item_reset_value'] = data
                                    .productData[index].itemResetValue
                                    .toString();
                                FutureBuilder(
                                  future: updateSubmenu(
                                      data.productData[index].id, param),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState !=
                                        ConnectionState.done) {
                                      return CommonFunction.showProgress(true);
                                    } else {
                                      data.productData[index].status;
                                      _controller =
                                          AdvancedSwitchController(false);
                                      setState(() {});
                                      return Container();
                                    }
                                  },
                                );
                                print('active');
                              } else {
                                Map<String, String> param = new HashMap();
                                param['menu_id'] =
                                    data.productData[index].menuId.toString();
                                param['name'] =
                                    data.productData[index].name.toString();
                                param['description'] = data
                                    .productData[index].description
                                    .toString();
                                param['type'] =
                                    data.productData[index].type.toString();
                                param['qty_reset'] =
                                    data.productData[index].qtyReset.toString();
                                param['price'] =
                                    data.productData[index].price.toString();
                                param['status'] = '1';
                                param['item_reset_value'] = data
                                    .productData[index].itemResetValue
                                    .toString();
                                FutureBuilder(
                                  future: updateSubmenu(
                                      data.productData[index].id, param),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState !=
                                        ConnectionState.done) {
                                      return CommonFunction.showProgress(true);
                                    } else {
                                      _controller =
                                          AdvancedSwitchController(true);
                                      setState(() {});
                                      return Container();
                                    }
                                  },
                                );
                                print('deActive');
                              }
                            });
                            return GestureDetector(
                              onTap: () {
                                showModelSheet(data.productData[index]);
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 20),
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                width: 100.w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 18.w,
                                      height: 20.w,
                                      margin: EdgeInsets.only(right: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image(
                                          image: NetworkImage(
                                              data.productData[index].image),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 48.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              data.productData[index].type ==
                                                      'veg'
                                                  ? SvgPicture.asset(
                                                      'assets/images/veg.svg')
                                                  : SvgPicture.asset(
                                                      'assets/images/nonveg.svg'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.48,
                                                child: Text(
                                                  data.productData[index].name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: Palette.loginhead,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          proxima_nova_bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data.productData[index].description,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                color: Palette.switchs,
                                                fontSize: 12,
                                                fontFamily: proxima_nova_reg),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$ ${data.productData[index].price}',
                                                style: TextStyle(
                                                    color: Palette.loginhead,
                                                    fontSize: 16,
                                                    fontFamily:
                                                        proxima_nova_reg),
                                              ),
                                              Text(
                                                "  |  ",
                                                style: TextStyle(
                                                    color: Palette.loginhead,
                                                    fontSize: 16,
                                                    fontFamily:
                                                        proxima_nova_reg),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                      builder: (context) =>
                                                          AddNewItem(null, true, data.productData[index])));
                                                },
                                                child: Text(
                                                  getTranslated(context, edit_this_product),
                                                  style: TextStyle(
                                                      color: Palette.blue,
                                                      fontSize: 12,
                                                      fontFamily:
                                                          proxima_nova_reg),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: 3,
                                          child: AdvancedSwitch(
                                            controller: _controller,
                                            activeColor: Palette.green,
                                            inactiveColor: Palette.removeacct,
                                            borderRadius: BorderRadius.all(
                                                const Radius.circular(5)),
                                            width: 20.w,
                                            height: 10.w,
                                            enabled: true,
                                            disabledOpacity: 0.5,
                                          ),
                                        ),
                                        Container(
                                          width: 03.w,
                                          child: RotatedBox(
                                            quarterTurns: 1,
                                            child: data.productData[index]
                                                        .status ==
                                                    1
                                                ? Text(
                                                    "IN STOCK",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Palette.green),
                                                  )
                                                : Text(
                                                    "OUT OF STOCK",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color:
                                                            Palette.removeacct),
                                                  ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : Container();
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Container();
            },
          ),
        ));
  }

  showModelSheet(ProductData productData) async {
    showModalBottomSheet(
      enableDrag: true,
      isDismissible: true,
      backgroundColor: Palette.sheet,
      context: context,
      elevation: 10,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withAlpha(50), blurRadius: 20),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: 100.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 18.w,
                        height: 20.w,
                        margin: EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image(
                            image: NetworkImage(productData.image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: 48.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                productData.type == 'veg'
                                    ? SvgPicture.asset('assets/images/veg.svg')
                                    : SvgPicture.asset(
                                        'assets/images/nonveg.svg'),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.48,
                                  child: Text(
                                    productData.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Palette.loginhead,
                                        fontSize: 16,
                                        fontFamily: proxima_nova_bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              productData.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: Palette.switchs,
                                  fontSize: 12,
                                  fontFamily: proxima_nova_reg),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$ ${productData.price}',
                                  style: TextStyle(
                                      color: Palette.loginhead,
                                      fontSize: 16,
                                      fontFamily: proxima_nova_reg),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          RotatedBox(
                            quarterTurns: 3,
                            child: AdvancedSwitch(
                              controller: productData.status == 1
                                  ? AdvancedSwitchController(true)
                                  : AdvancedSwitchController(false),
                              activeColor: Palette.green,
                              inactiveColor: Palette.removeacct,
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(5)),
                              width: 20.w,
                              height: 10.w,
                              enabled: false,
                              disabledOpacity: 0.5,
                            ),
                          ),
                          Container(
                            width: 03.w,
                            child: RotatedBox(
                              quarterTurns: 1,
                              child: productData.status == 1
                                  ? Text(
                                      "IN STOCK",
                                      style: TextStyle(
                                          fontSize: 10, color: Palette.green),
                                    )
                                  : Text(
                                      "OUT OF STOCK",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Palette.removeacct),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTranslated(context, customization_list),
                        style: TextStyle(
                            fontSize: 15,
                            color: Palette.loginhead,
                            fontFamily: "ProximaBold"),
                      ),
                      GestureDetector(
                        onTap: () {
                          CommonFunction.displayAlert(context);
                          /*Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CustomizationOptionScreen()));*/
                        },
                        child: Text(
                          getTranslated(context, edit_customization_list),
                          style: TextStyle(
                              fontSize: 16,
                              color: Palette.blue,
                              fontFamily: "ProximaNova"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100.w,
                  height: 25.w,
                  child: FutureBuilder<BaseModel<ProductCustomizationResponse>>(
                    future: getCustomization(productData.id),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.connectionState !=
                            ConnectionState.waiting) {
                          return snapshot.data.data.customizationData.length > 0
                              ? ListView.builder(
                                  itemCount: snapshot
                                      .data.data.customizationData.length,
                                  itemBuilder: (context, index) {
                                    List<dynamic> listData = jsonDecode(snapshot
                                        .data
                                        .data
                                        .customizationData[index]
                                        .custimazationItem);
                                    return Container(
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      height: 20.w,
                                      child: ListView.builder(
                                        itemCount: listData.length,
                                        itemBuilder: (context, index) {
                                          return listData.length > 0
                                              ? Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 10, top: 10),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${listData[index]['name']}",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Palette
                                                                .loginhead,
                                                            fontFamily:
                                                                "ProximaBold"),
                                                      ),
                                                      Text(
                                                        "\u0024 ${listData[index]['price']}",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Palette
                                                                .loginhead,
                                                            fontFamily:
                                                                "ProximaNova"),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Text(getTranslated(context, data_not_available));
                                        },
                                      ),
                                    );
                                  })
                              : Center(child: Text(getTranslated(context, data_not_available)));
                        }
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) =>
                            AddNewItem(null, true, productData)));
                  },
                  child: Container(
                    color: Palette.green,
                    height: 40,
                    width: 100.w,
                    child: Center(
                      child: Text(
                        getTranslated(context, edit_this_product),
                        style: TextStyle(
                            fontSize: 15,
                            color: Palette.white,
                            fontFamily: proxima_nova_reg),
                      ),
                    ),
                  ),
                ))
          ]),
        );
      },
    );
  }

}
