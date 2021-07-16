import 'dart:convert';
import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealup_restaurant_side/config/Palette.dart';
import 'package:mealup_restaurant_side/constant/app_strings.dart';
import 'package:mealup_restaurant_side/constant/common_function.dart';
import 'package:mealup_restaurant_side/localization/localization_constant.dart';
import 'package:mealup_restaurant_side/models/insights_response.dart';
import 'package:mealup_restaurant_side/retrofit/base_model.dart';
import 'package:mealup_restaurant_side/utilities/prefConstatnt.dart';
import 'package:mealup_restaurant_side/utilities/preference.dart';
import 'package:sizer/sizer.dart';

/*String _chosenValue = 'Yearly';
String _showValue = 'Yearly';
String _chosenValue2 = 'Yearly';
String _showValue2 = 'Yearly';*/
List<Double> leftData = [];
List<String> bottomData = [];
String currencySymbol = '';

List<Color> gradientColors = [
  const Color(0xff23b6e6),
  const Color(0xff02d39a),
];

class InsightScreen extends StatefulWidget {
  @override
  _InsightScreenState createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  Future insightFuture;

  @override
  void initState() {
    insightFuture = getInsights();
    currencySymbol =
        SharedPreferenceHelper.getString(Preferences.currency_symbol);
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
          getTranslated(context, insight),
          style: TextStyle(
              fontFamily: "ProximaBold",
              color: Palette.loginhead,
              fontSize: 18),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'))),
          child: FutureBuilder<BaseModel<InsightsResponse>>(
            future: insightFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CommonFunction.showProgress(true);
                } else {
                  var data = snapshot.data.data;
                  if (data != null) {
                    Map<String, dynamic> jsonEarningData =
                        jsonDecode(data.data.earningChart);
                    Map<String, dynamic> jsonOrderData =
                        jsonDecode(data.data.orderChart);
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withAlpha(80),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  height: 30.w,
                                  width: 27.w,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getTranslated(context, today),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          getTranslated(context, orders),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          data.data.todayOrder.toString(),
                                          style: TextStyle(
                                              fontFamily: "ProximaBold",
                                              color: Palette.inorder,
                                              fontSize: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withAlpha(80),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  height: 30.w,
                                  width: 27.w,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                        getTranslated(context, total),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        Text(
                                            getTranslated(context, orders),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          data.data.totalOrder.toString(),
                                          style: TextStyle(
                                              fontFamily: "ProximaBold",
                                              color: Palette.removeacct,
                                              fontSize: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withAlpha(80),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  height: 30.w,
                                  width: 27.w,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                      getTranslated(context, today),
                                          style: TextStyle(
                                              fontFamily: proxima_nova_reg,
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          getTranslated(context, earnings),
                                          style: TextStyle(
                                              fontFamily: proxima_nova_reg,
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(
                                          '$currencySymbol ${data.data.todayEarnings.toString()}',
                                          style: TextStyle(
                                              fontFamily: proxima_nova_bold,
                                              color: Palette.intlearning,
                                              fontSize: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withAlpha(80),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  height: 30.w,
                                  width: 27.w,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getTranslated(context, total),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        Text(
                                              getTranslated(context, earnings),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          '$currencySymbol ${data.data.totalEarnings.toString()}',
                                          style: TextStyle(
                                              fontFamily: "ProximaBold",
                                              color: Palette.intodayear,
                                              fontSize: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withAlpha(80),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  height: 30.w,
                                  width: 27.w,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          getTranslated(context, total),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        Text(
                                        getTranslated(context, product),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          data.data.totalMenu.toString(),
                                          style: TextStyle(
                                              fontFamily: "ProximaBold",
                                              color: Palette.ttlprdct,
                                              fontSize: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withAlpha(80),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  height: 30.w,
                                  width: 27.w,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                        getTranslated(context, total),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          getTranslated(context, product_item),
                                          style: TextStyle(
                                              fontFamily: "ProximaNova",
                                              color: Palette.loginhead,
                                              fontSize: 13.5),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Text(
                                          data.data.totalSubmenu.toString(),
                                          style: TextStyle(
                                              fontFamily: "ProximaBold",
                                              color: Palette.ttlitem,
                                              fontSize: 30),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(getTranslated(context,earnings),
                                            style: TextStyle(
                                                color: Palette.loginhead,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        Text('2021',
                                            style: TextStyle(
                                              color: Palette.switchs,
                                              fontSize: 12,
                                            )),
                                      ],
                                    ),
                                    /*DropdownButton<String>(
                                      value: _chosenValue,
                                      style: TextStyle(
                                          color: Palette.loginhead, fontSize: 16),
                                      items: <String>[
                                        'Yearly',
                                        'Monthly',
                                        'Weekly',
                                        'Daily',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _chosenValue = value;
                                          _showValue = value;
                                        });
                                      },
                                    ),*/
                                  ],
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0, top: 10),
                                    height: 35.h,
                                    width: 100.w,
                                    child: LineChart(
                                      showEarningData(jsonEarningData),
                                      swapAnimationDuration:
                                          const Duration(milliseconds: 250),
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(getTranslated(context,orders),
                                            style: TextStyle(
                                                color: Palette.loginhead,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        Text('2021',
                                            style: TextStyle(
                                              color: Palette.switchs,
                                              fontSize: 12,
                                            )),
                                      ],
                                    ),
                                    /*DropdownButton<String>(
                                      value: _chosenValue,
                                      style: TextStyle(
                                          color: Palette.loginhead, fontSize: 16),
                                      items: <String>[
                                        'Yearly',
                                        'Monthly',
                                        'Weekly',
                                        'Daily',
                                      ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _chosenValue = value;
                                          _showValue = value;
                                        });
                                      },
                                    ),*/
                                  ],
                                ),
                                Container(
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0, top: 10),
                                    height: 35.h,
                                    width: 100.w,
                                    child: LineChart(
                                      showOrderData(jsonOrderData),
                                      swapAnimationDuration:
                                          const Duration(milliseconds: 250),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }
              } else {
                return CommonFunction.showProgress(true);
              }
            },
          ),
        ),
      ),
    );
  }
}

LineChartData showEarningData(Map<String, dynamic> jsonData) {
  List<dynamic> eData = jsonData['data'];
  List<dynamic> lData = jsonData['label'];
  return LineChartData(
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
      touchCallback: (LineTouchResponse touchResponse) {},
      handleBuiltInTouches: true,
    ),
    borderData: FlBorderData(
        show: true, border: Border.all(color: Colors.white, width: 0)),
    gridData: FlGridData(
      show: true,
      drawHorizontalLine: true,
      horizontalInterval: 1,
      getDrawingVerticalLine: (value) {
        return FlLine(
            color: Palette.loginhead, strokeWidth: 0.5, dashArray: [10]);
      },
      getDrawingHorizontalLine: (value) {
        return FlLine(
            color: Palette.loginhead, strokeWidth: 0.5, dashArray: [10]);
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 10,
        margin: 10,
        getTextStyles: (value) => TextStyle(
          color: Palette.loginhead,
          fontWeight: FontWeight.normal,
          fontSize: 5,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return "${lData.first}";
            case 1:
              return "${lData[1]}";
            case 2:
              return "${lData[2]}";
            case 3:
              return "${lData[3]}";
            case 4:
              return "${lData[4]}";
            case 5:
              return "${lData[5]}";
            case 6:
              return "${lData[6]}";
            case 7:
              return "${lData[7]}";
            case 8:
              return "${lData[8]}";
            case 9:
              return "${lData[9]}";
            case 10:
              return "${lData[10]}";
            case 11:
              return "${lData[11]}";
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Palette.loginhead,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '$currencySymbol 1000';
            case 3:
              return '$currencySymbol 2000';
            case 5:
              return '$currencySymbol 3000';
            case 7:
              return '$currencySymbol 4000';
            case 9:
              return '$currencySymbol 5000';
            case 11:
              return '$currencySymbol 6000';
          }
          return '';
        },
        reservedSize: 30,
        margin: 10,
      ),
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 12,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, eData.first.toDouble() / 100),
          FlSpot(1, eData[1].toDouble() / 100),
          FlSpot(2, eData[2].toDouble() / 100),
          FlSpot(3, eData[3].toDouble() / 100),
          FlSpot(4, eData[4].toDouble() / 100),
          FlSpot(5, eData[5].toDouble() / 100),
          FlSpot(6, eData[6].toDouble() / 100),
          FlSpot(7, eData[7].toDouble() / 100),
          FlSpot(8, eData[8].toDouble() / 100),
          FlSpot(9, eData[9].toDouble() / 100),
          FlSpot(10, eData[10].toDouble() / 100),
          FlSpot(11, eData[11].toDouble() / 100),
        ],
        isCurved: true,
        barWidth: 1,
        colors: [Palette.loginhead, Palette.green],
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          ColorTween(begin: gradientColors[0], end: gradientColors[1])
              .lerp(0.2)
              .withOpacity(0.1),
          ColorTween(begin: gradientColors[0], end: gradientColors[1])
              .lerp(0.2)
              .withOpacity(0.1),
        ]),
      ),
    ],
  );
}

LineChartData showOrderData(Map<String, dynamic> jsonData) {
  List<dynamic> eData = jsonData['data'];
  List<dynamic> lData = jsonData['label'];
  return LineChartData(
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
      ),
      touchCallback: (LineTouchResponse touchResponse) {},
      handleBuiltInTouches: true,
    ),
    borderData: FlBorderData(
        show: true, border: Border.all(color: Colors.white, width: 0)),
    gridData: FlGridData(
      show: true,
      drawHorizontalLine: true,
      horizontalInterval: 1,
      getDrawingVerticalLine: (value) {
        return FlLine(
            color: Palette.loginhead, strokeWidth: 0.5, dashArray: [10]);
      },
      getDrawingHorizontalLine: (value) {
        return FlLine(
            color: Palette.loginhead, strokeWidth: 0.5, dashArray: [10]);
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 10,
        margin: 10,
        getTextStyles: (value) => TextStyle(
          color: Palette.loginhead,
          fontWeight: FontWeight.normal,
          fontSize: 5,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return "${lData.first}";
            case 1:
              return "${lData[1]}";
            case 2:
              return "${lData[2]}";
            case 3:
              return "${lData[3]}";
            case 4:
              return "${lData[4]}";
            case 5:
              return "${lData[5]}";
            case 6:
              return "${lData[6]}";
            case 7:
              return "${lData[7]}";
            case 8:
              return "${lData[8]}";
            case 9:
              return "${lData[9]}";
            case 10:
              return "${lData[10]}";
            case 11:
              return "${lData[11]}";
          }
          return '';
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (value) => const TextStyle(
          color: Palette.loginhead,
          fontWeight: FontWeight.normal,
          fontSize: 12,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10';
            case 3:
              return '20';
            case 5:
              return '30';
            case 7:
              return '40';
            case 9:
              return '50';
            case 11:
              return '60';
          }
          return '';
        },
        reservedSize: 20,
        margin: 10,
      ),
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 12,
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, eData.first.toDouble() / 100),
          FlSpot(1, eData[1].toDouble() / 100),
          FlSpot(2, eData[2].toDouble() / 100),
          FlSpot(3, eData[3].toDouble() / 100),
          FlSpot(4, eData[4].toDouble() / 100),
          FlSpot(5, eData[5].toDouble() / 100),
          FlSpot(6, eData[6].toDouble() / 100),
          FlSpot(7, eData[7].toDouble() / 100),
          FlSpot(8, eData[8].toDouble() / 100),
          FlSpot(9, eData[9].toDouble() / 100),
          FlSpot(10, eData[10].toDouble() / 100),
          FlSpot(11, eData[11].toDouble() / 100),
        ],
        isCurved: true,
        barWidth: 1,
        colors: [Palette.loginhead, Palette.green],
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: true,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          ColorTween(begin: gradientColors[0], end: gradientColors[1])
              .lerp(0.2)
              .withOpacity(0.1),
          ColorTween(begin: gradientColors[0], end: gradientColors[1])
              .lerp(0.2)
              .withOpacity(0.1),
        ]),
      ),
    ],
  );
}
