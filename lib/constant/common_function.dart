import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mealup_restaurant_side/config/Palette.dart';
import 'package:mealup_restaurant_side/constant/app_strings.dart';
import 'package:mealup_restaurant_side/localization/localization_constant.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class CommonFunction {

  static Future<bool> checkNetwork() async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      toastMessage("No Internet Connection");
      return false;
    }
  }

  static Future<bool> checkServiceEnable() async {
   var isEnable = await Geolocator.isLocationServiceEnabled();
   return isEnable;
  }

  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        //timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static checkForPermission() async {

    LocationPermission permission = await Geolocator.requestPermission();

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){

      permission = await Geolocator.requestPermission();
      print("denied");
      // Constants.CheckNetwork().whenComplete(() =>    callApiForsetting());


    }else if(permission == LocationPermission.whileInUse){
      print("whileInUse56362");

      // Constants.CheckNetwork().whenComplete(() =>    callApiForsetting());
    //  Constants.currentlatlong().whenComplete(() => Constants.currentlatlong().then((value){print("origin123:$value");}));
    //  Constants.cuttentlocation().whenComplete(() => Constants.cuttentlocation().then((value){}));

    }else if(permission == LocationPermission.always){

      print("always");
      // Constants.CheckNetwork().whenComplete(() =>    callApiForsetting());
      //Constants.currentlatlong().whenComplete(() => Constants.currentlatlong().then((value){print("origin123:$value");}));
    //  Constants.cuttentlocation().whenComplete(() => Constants.cuttentlocation().then((value){}));

    }




  }

  static Widget showProgress(isShowProgress) {
     return ModalProgressHUD(
      inAsyncCall: isShowProgress,
      color: Colors.transparent,
      progressIndicator: SpinKitFadingCircle(color: Palette.green),
      child: Container(),
    );
  }

  static void displayAlert(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.only(left: 20, right: 20, top: 20),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white24, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          title: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(0),
                color: Palette.loginhead,
                child: Center(
                    child: Text(
                      'Alert',
                      style: TextStyle(
                          fontFamily: proxima_nova_bold,
                          color: Colors.white,
                          fontSize: 14),
                    )),
              ),
            ),
          ),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  //height: MediaQuery.of(context).size.height / 2.5,
                  child: Wrap(
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              getTranslated(context, coming_soon),
                              style: TextStyle(
                                  color: Palette.loginhead,
                                  fontSize: 16,
                                  fontFamily: proxima_nova_bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Palette.green),
              child: Text(
                'Ok',
                style: TextStyle(
                    fontFamily: proxima_nova_bold,
                    fontSize: 12,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),

          ],
        );
      },
    );
  }

}
