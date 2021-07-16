import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealup_restaurant_side/main.dart';
import 'package:mealup_restaurant_side/utilities/prefConstatnt.dart';
import 'package:mealup_restaurant_side/utilities/preference.dart';

import 'lang_localizations.dart';

String getTranslated(BuildContext context, String key){
  return LanguageLocalization.of(context).getTranslateValue(key);
}

const String ENGLISH = "en";
const String SPANISH = "es";

Future<Locale> setLocale(String languageCode) async{
  SharedPreferenceHelper.setString(Preferences.current_language_code, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode){
  Locale _temp;
  switch(languageCode){
    case ENGLISH:
      _temp  = Locale(languageCode, 'US');
      break;
    case SPANISH:
      _temp  = Locale(languageCode, 'ES');
      break;
    default:
      _temp = Locale(ENGLISH, 'US');
  }
  return _temp;
}

Future<Locale> getLocale() async{
  String languageCode = SharedPreferenceHelper.getString(Preferences.current_language_code);
  return _locale(languageCode);
}
