import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealup_restaurant_side/config/Palette.dart';
import 'package:mealup_restaurant_side/constant/app_strings.dart';
import 'package:mealup_restaurant_side/constant/common_function.dart';
import 'package:mealup_restaurant_side/localization/localization_constant.dart';
import 'package:mealup_restaurant_side/models/my_cash_balance_response.dart';
import 'package:mealup_restaurant_side/retrofit/base_model.dart';
import 'package:sizer/sizer.dart';

class CashBalanceScreen extends StatefulWidget {
  @override
  _CashBalanceScreenState createState() => _CashBalanceScreenState();
}

class _CashBalanceScreenState extends State<CashBalanceScreen> {
  final TextEditingController searchController = TextEditingController();
  ScrollController _scrollController;

  static const Duration _duration = Duration(seconds: 1);
  Timer _timer = Timer(_duration, () {});
  String _lastSearchTerm = '';

  void _search() {
    if (_timer.isActive) this._timer.cancel();
    this._timer = Timer(_duration, () {
      // Only fetch new data if input has changed from last request.
      if (this._lastSearchTerm != this.searchController.text) {
        setState(() {
          this._scrollController.jumpTo(0);
          this._lastSearchTerm = this.searchController.text;
        });
      }
    });
  }

  Future cashBalanceFuture;

  @override
  void initState() {
    cashBalanceFuture = getCashBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          getTranslated(context, my_cash_balance),
          style: TextStyle(
              fontFamily: "ProximaBold",
              color: Palette.loginhead,
              fontSize: 17),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace_outlined,
              color: Colors.black,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'))),
          child: FutureBuilder<BaseModel<MyCashBalanceResponse>>(
            future: cashBalanceFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return CommonFunction.showProgress(true);
              } else {
                var data = snapshot.data.data;
                if (data != null) {
                  return Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),),
                    height: 100.h,
                    width: 100.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Container(
                         padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             boxShadow: [
                               BoxShadow(
                                   color: Colors.grey.withAlpha(50),
                                   spreadRadius: 1,
                                   blurRadius: 1),
                             ],
                             borderRadius: BorderRadius.all(Radius.circular(20))),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(
                             height: 10,
                           ),
                           Text(getTranslated(context, total_balance),
                             style: TextStyle(
                                 color: Palette.switchs,
                                 fontFamily: "ProximaNova",
                                 fontSize: 14),
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Text(
                             "\u0024${data.data.totalBalance}",
                             style: TextStyle(
                                 color: Palette.green,
                                 fontFamily: proxima_nova_reg,
                                 fontSize: 26),
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Container(
                             decoration: BoxDecoration(
                                 color: Colors.grey.withAlpha(50),
                                 borderRadius: BorderRadius.all(Radius.circular(20))),
                             child: TextField(
                               style: TextStyle(
                                   color: Colors.black, fontSize: 14),
                               controller: searchController,
                               decoration: InputDecoration(
                                 border: OutlineInputBorder(
                                   borderRadius: BorderRadius.circular(20),
                                   borderSide: BorderSide(
                                     width: 0,
                                     style: BorderStyle.none,
                                   ),
                                 ),
                                 fillColor: Palette.divider.withAlpha(50),
                                 filled: true,
                                 hintText:
                                 'Search Order ID / Bank Acc. Number',
                                 hintStyle: TextStyle(
                                     color: Palette.bonjour,
                                     fontSize: 14,
                                     fontFamily: proxima_nova_reg),
                                 suffixIcon: Icon(Icons.search,
                                     color: Palette.bonjour),
                                 // suffixIcon: IconButton(
                                 //   onPressed: () => this._clearSearch(),
                                 //   icon: Icon(Icons.clear, color: Palette.bonjour),
                                 // ),
                               ),
                               onChanged: (_) => _search(),
                             ),
                           ),
                         ],
                       ),),
                        SizedBox(height: 20,),
                        Flexible(
                          child: ListView.separated(
                            separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                              color: Colors.grey,
                            ),
                            itemCount: data.data.balance.length,
                            itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "OID: ",
                                          style: TextStyle(
                                              color: Palette.loginhead,
                                              fontFamily: "ProximaBold",
                                              fontSize: 16),
                                        ),
                                        Text(
                                          data.data.balance[index].orderId,
                                          style: TextStyle(
                                              color: Palette.loginhead,
                                              fontFamily: "ProximaBold",
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "\u0024${data.data.balance[index].amount}",
                                      style: TextStyle(
                                          color: Palette.green,
                                          fontFamily: "ProximaNova",
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                data.data.balance[index].name,
                                  style: TextStyle(
                                      color: Palette.switchs,
                                      fontFamily: "ProximaBold",
                                      fontSize: 16),
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Text(
                                      data.data.balance[index].date,
                                      style: TextStyle(
                                          color: Palette.switchs,
                                          fontFamily: "ProximaNova",
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },),
                        )
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
