import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mealup_restaurant_side/config/Palette.dart';
import 'package:mealup_restaurant_side/constant/app_strings.dart';
import 'package:mealup_restaurant_side/localization/localization_constant.dart';
import 'package:mealup_restaurant_side/models/user.dart';
import 'package:mealup_restaurant_side/models/vendor_setting_response.dart';
import 'package:mealup_restaurant_side/retrofit/api_client.dart';
import 'package:mealup_restaurant_side/retrofit/api_header.dart';
import 'package:mealup_restaurant_side/retrofit/base_model.dart';
import 'package:mealup_restaurant_side/retrofit/server_error.dart';
import 'package:mealup_restaurant_side/screens/auth/OtpScreen.dart';
import 'package:mealup_restaurant_side/screens/auth/RegisterScreen.dart';
import 'package:mealup_restaurant_side/utilities/device_utils.dart';
import 'package:mealup_restaurant_side/utilities/prefConstatnt.dart';
import 'package:mealup_restaurant_side/utilities/preference.dart';
import 'package:mealup_restaurant_side/utilities/transitions.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../MainScreen.dart';

final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String emailError = '';
  String passError = '';
  bool _showProgress = false;

  bool isTokenDone = false;

  @override
  void initState() {
    // TODO: implement initState
    getVendorSetting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final node = FocusScope.of(context);

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showProgress,
        opacity: 1.0,
        color: Colors.transparent.withOpacity(0.2),
        progressIndicator: SpinKitFadingCircle(color: Palette.green),
        child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/images/ls.png',
              ),
              fit: BoxFit.fill,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        getTranslated(context, email),
                        style: TextStyle(
                            color: Palette.loginhead,
                            fontSize: 16,
                            fontFamily: proxima_nova_bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Palette.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      emailError = '';
                                    });
                                  },
                                  onEditingComplete: () => node.nextFocus(),
                                  controller: emailController,
                                  cursorColor: Palette.loginhead,
                                  decoration: InputDecoration(
                                      hintText: getTranslated(context, email_hint),
                                      hintStyle: TextStyle(
                                          color: Palette.switchs, fontSize: 16),
                                      border: InputBorder.none),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            visible: emailError.isEmpty ? false : true,
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                emailError,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontFamily: proxima_nova_bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                          getTranslated(context, password),
                        style: TextStyle(
                            color: Palette.loginhead,
                            fontSize: 16,
                            fontFamily: proxima_nova_bold),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Palette.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: TextField(
                                  controller: passController,
                                  obscureText: true,
                                  textInputAction: TextInputAction.send,
                                  cursorColor: Palette.loginhead,
                                  onChanged: (value) {
                                    setState(() {
                                      passError = '';
                                    });
                                  },
                                  onEditingComplete: () => node.unfocus(),
                                  decoration: InputDecoration(
                                      hintText: getTranslated(context, password_hint),
                                      alignLabelWithHint: true,
                                      hintStyle: TextStyle(
                                          color: Palette.switchs, fontSize: 16),
                                      border: InputBorder.none),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            visible: passError.isEmpty ? false : true,
                            child: Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                passError,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontFamily: proxima_nova_bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                /*Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Palette.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: Palette.loginhead,
                                      radius: 20,
                                      child: CircleAvatar(
                                        radius: 17,
                                        backgroundImage: NetworkImage(
                                            'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg'),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down_outlined)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Palette.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  '+1',
                                  style: TextStyle(
                                      color: Palette.switchs, fontSize: 14),
                                ),
                                VerticalDivider(
                                  width: 1,
                                  thickness: 2,
                                  indent: 10,
                                  endIndent: 10,
                                  color: Palette.switchs,
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "000 000 0000",
                                        hintStyle: TextStyle(
                                            color: Palette.switchs, fontSize: 14),
                                        border: InputBorder.none),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                // VerticalDivider(height: 2,thickness: 2,indent: 1,endIndent: 8,color: Palette.switchs,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      passError,
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontFamily: 'ProximaBold'),
                    ),
                  ],
                ),*/
                Center(
                  child: MaterialButton(
                    height: 45,
                    minWidth: width * 0.8,
                    color: Palette.green,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
                    child: Text(
                        getTranslated(context, button_login),
                      style:
                          TextStyle(fontFamily: proxima_nova_reg, fontSize: 16),
                    ),
                    onPressed: () {
                      if (emailController.text.isEmpty) {
                        setState(() {
                          emailError =  getTranslated(context, empty_error_text);
                        });
                      }
                      else if (!DeviceUtils.isValidEmail(emailController.text)) {
                        emailError = getTranslated(context, email_valid_error_text) ;
                        setState(() {});
                      } 
                      else if (passController.text.isEmpty) {
                        passError = getTranslated(context, empty_error_text) ;
                        setState(() {});
                      } else {
                        //isTokenDone ? checkLogin(emailController.text, passController.text) : CommonFunction.toastMessage('Try again');
                        checkLogin(emailController.text, passController.text);
                      }
                    },
                    splashColor: Colors.white30,
                    
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: GestureDetector(
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: proxima_nova_reg,
                            ),
                            text: getTranslated(context,do_not_have_an_account),
                            children: [
                          TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: proxima_nova_bold,
                              ),
                              text: getTranslated(context,register) )
                        ])),
                    onTap: () => Navigator.of(context).push(Transitions(
                        transitionType: TransitionType.slideUp,
                        curve: Curves.bounceInOut,
                        reverseCurve: Curves.fastLinearToSlowEaseIn,
                        widget: RegisterScreen())),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<BaseModel<User>> checkLogin(String email, String password) async {
    User response;
    try {
      setState(() {
        _showProgress = true;
      });
      String deviceToken = SharedPreferenceHelper.getString(Preferences.device_token);
      response = await client.login(email, password, deviceToken);
      if (response.data.isVerified == 1) {
        saveValueInPref(response);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OtpScreen(response)),
        );
      }

      setState(() {
        _showProgress = false;
      });
    } catch (error, stacktrace) {
      setState(() {
        _showProgress = false;
      });
      print("Exception occur: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<VendorSettingResponse>> getVendorSetting() async {
    VendorSettingResponse response;
    try {
      response = await ApiClient(ApiHeader().dioData()).vendorSetting();
      SharedPreferenceHelper.setString(
          Preferences.vendor_app_id, response.data.vendorAppId);
      SharedPreferenceHelper.setString(
          Preferences.currency, response.data.currency);
      SharedPreferenceHelper.setString(
          Preferences.currency_symbol, response.data.currencySymbol);
      getOneSingleToken(
          SharedPreferenceHelper.getString(Preferences.vendor_app_id));
    } catch (error, stacktrace) {
      print("Exception occur: $error stackTrace: $stacktrace");
      return BaseModel()..setException(ServerError.withError(error: error));
    }
    return BaseModel()..data = response;
  }

  Future<void> getOneSingleToken(appId) async {
    //one signal mate
    OneSignal.shared.consentGranted(true);
    OneSignal.shared.setAppId(appId);
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    await OneSignal.shared
        .promptUserForPushNotificationPermission(fallbackToSettings: true);
    OneSignal.shared.promptLocationPermission();
    await OneSignal.shared.getDeviceState().then((value) =>
        SharedPreferenceHelper.setString(Preferences.device_token, value.userId));
    setState(() {
      isTokenDone = true;
      print('token ======  ${SharedPreferenceHelper.getString(Preferences.device_token)}');
    });
    /*Timer(Duration(seconds: 5), () async {
      var playerId = status.userId;
      print('the player id is $playerId');
      // Prefs.setString(Const.deviceToken, playerId);
    });*/
  }

  void saveValueInPref(User response) {
    SharedPreferenceHelper.setBoolean(Preferences.is_logged_in, true);
    SharedPreferenceHelper.setString(
        Preferences.id, response.data.id.toString());
    SharedPreferenceHelper.setString(Preferences.name, response.data.name);
    SharedPreferenceHelper.setString(Preferences.image, response.data.image);
    SharedPreferenceHelper.setString(
        Preferences.email_id, response.data.emailId);
    SharedPreferenceHelper.setString(
        Preferences.email_verified_at, response.data.emailVerifiedAt);
    SharedPreferenceHelper.setString(
        Preferences.device_token, response.data.deviceToken);
    SharedPreferenceHelper.setString(Preferences.phone, response.data.phone);
    SharedPreferenceHelper.setString(
        Preferences.phone_code, response.data.phoneCode);
    SharedPreferenceHelper.setString(
        Preferences.is_verified, response.data.isVerified.toString());
    SharedPreferenceHelper.setString(Preferences.otp, response.data.otp);
    SharedPreferenceHelper.setString(
        Preferences.status, response.data.status.toString());
    SharedPreferenceHelper.setString(
        Preferences.faviroute, response.data.faviroute);
    SharedPreferenceHelper.setString(
        Preferences.vendor_id, response.data.vendorId);
    SharedPreferenceHelper.setString(
        Preferences.language, response.data.language);
    SharedPreferenceHelper.setString(
        Preferences.ifsc_code, response.data.ifscCode);
    SharedPreferenceHelper.setString(
        Preferences.account_name, response.data.accountName);
    SharedPreferenceHelper.setString(
        Preferences.account_number, response.data.accountNumber);
    SharedPreferenceHelper.setString(
        Preferences.micr_code, response.data.micrCode);
    SharedPreferenceHelper.setString(Preferences.token, response.data.token);
  }
}
