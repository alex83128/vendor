import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealup_restaurant_side/config/Palette.dart';
import 'package:mealup_restaurant_side/constant/app_strings.dart';
import 'package:mealup_restaurant_side/localization/localization_constant.dart';
import 'package:mealup_restaurant_side/models/user.dart';

import '../MainScreen.dart';



// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {
  User response;
  OtpScreen(User response){this.response = response;}

  @override
  _OtpScreenState createState() => _OtpScreenState(response);
}

class _OtpScreenState extends State<OtpScreen> {
  User response;
  _OtpScreenState(User response){this.response = response;}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark,
      //set brightness for icons, like dark background light icons
    ));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
              getTranslated(context, otp),
            style: TextStyle(fontFamily: "ProximaBold", color: Palette.loginhead),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace_outlined,
              color: Colors.black,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/loginn.png'))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Center(
                    child: Container(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Center(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Image.asset(
                          'assets/images/otp.png',
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTranslated(context, enter_otp),
                          style: TextStyle(
                              color: Palette.loginhead,
                              fontSize: 16,
                              fontFamily: proxima_nova_bold),
                        ),
                        Text(
                          '00:30',
                          style: TextStyle(
                              color: Palette.switchs,
                              fontSize: 14,
                              fontFamily: proxima_nova_reg),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OTPDigitTextFieldBox(first: true, last: false),
                      OTPDigitTextFieldBox(first: false, last: false),
                      OTPDigitTextFieldBox(first: false, last: false),
                      OTPDigitTextFieldBox(first: false, last: true),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Palette.green),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            'Verify Now',
                            style: TextStyle(
                                fontFamily: proxima_nova_reg,
                                color: Palette.white,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't receive code ?",
                          style: TextStyle(
                              fontFamily: proxima_nova_reg,
                              fontSize: 14,
                              color: Palette.loginhead),
                        ),
                        Text(
                          " Resend Again",
                          style: TextStyle(
                              fontFamily: proxima_nova_bold,
                              fontSize: 14,
                              color: Palette.loginhead),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                    child: Text(
                      "We will share a one OTP code, Don't share this code with any other people,Please check your device.",
                        textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Palette.switchs, fontFamily: proxima_nova_reg,fontSize: 12),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  const OTPDigitTextFieldBox(
      {this.first, this.last});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey.withAlpha(50), blurRadius: 1, spreadRadius: 1)
          ], color: Palette.white,borderRadius: BorderRadius.circular(25)),
      height: 80,
      width: 80,
      child: Center(
        child: TextField(
          style: TextStyle(color: Palette.loginhead,fontSize: 26,fontFamily: proxima_nova_reg),
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          // style: MyStyles.inputTextStyle,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            // contentPadding: EdgeInsets.all(0),
            counter: Offstage(),
            // hintText: "*",
            // hintStyle: TextStyle(color: Palette.switchs),
          ),
        ),
      ),
    );
  }
}