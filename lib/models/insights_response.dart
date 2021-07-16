import 'package:mealup_restaurant_side/retrofit/api_client.dart';
import 'package:mealup_restaurant_side/retrofit/api_header.dart';
import 'package:mealup_restaurant_side/retrofit/base_model.dart';
import 'package:mealup_restaurant_side/retrofit/server_error.dart';

/// success : true
/// data : {"today_order":1,"total_order":1,"total_earnings":0,"today_earnings":0,"total_menu":5,"total_submenu":23,"order_chart":"{\"data\":[1,0,0,0,0,0,0,0,0,0,0,0],\"label\":[\"Jun-21\",\"May-21\",\"Apr-21\",\"Mar-21\",\"Feb-21\",\"Jan-21\",\"Dec-20\",\"Nov-20\",\"Oct-20\",\"Sep-20\",\"Aug-20\",\"Jul-20\"]}","earning_chart":"{\"data\":[0,0,0,0,0,0,0,0,0,0,0,0],\"label\":[\"Jun-21\",\"May-21\",\"Apr-21\",\"Mar-21\",\"Feb-21\",\"Jan-21\",\"Dec-20\",\"Nov-20\",\"Oct-20\",\"Sep-20\",\"Aug-20\",\"Jul-20\"]}"}

Future<BaseModel<InsightsResponse>> getInsights() async {
  InsightsResponse response;
  try {
    response = await ApiClient(ApiHeader().dioData()).insights();
  } catch (error, stacktrace) {
    print("Exception occur: $error stackTrace: $stacktrace");
    return BaseModel()..setException(ServerError.withError(error: error));
  }
  return BaseModel()..data = response;
}


class InsightsResponse {
  bool _success;
  Data _data;

  bool get success => _success;
  Data get data => _data;

  InsightsResponse({
      bool success, 
      Data data}){
    _success = success;
    _data = data;
}

  InsightsResponse.fromJson(dynamic json) {
    _success = json["success"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// today_order : 1
/// total_order : 1
/// total_earnings : 0
/// today_earnings : 0
/// total_menu : 5
/// total_submenu : 23
/// order_chart : "{\"data\":[1,0,0,0,0,0,0,0,0,0,0,0],\"label\":[\"Jun-21\",\"May-21\",\"Apr-21\",\"Mar-21\",\"Feb-21\",\"Jan-21\",\"Dec-20\",\"Nov-20\",\"Oct-20\",\"Sep-20\",\"Aug-20\",\"Jul-20\"]}"
/// earning_chart : "{\"data\":[0,0,0,0,0,0,0,0,0,0,0,0],\"label\":[\"Jun-21\",\"May-21\",\"Apr-21\",\"Mar-21\",\"Feb-21\",\"Jan-21\",\"Dec-20\",\"Nov-20\",\"Oct-20\",\"Sep-20\",\"Aug-20\",\"Jul-20\"]}"

class Data {
  int _todayOrder;
  int _totalOrder;
  int _totalEarnings;
  int _todayEarnings;
  int _totalMenu;
  int _totalSubmenu;
  String _orderChart;
  String _earningChart;

  int get todayOrder => _todayOrder;
  int get totalOrder => _totalOrder;
  int get totalEarnings => _totalEarnings;
  int get todayEarnings => _todayEarnings;
  int get totalMenu => _totalMenu;
  int get totalSubmenu => _totalSubmenu;
  String get orderChart => _orderChart;
  String get earningChart => _earningChart;

  Data({
      int todayOrder, 
      int totalOrder, 
      int totalEarnings, 
      int todayEarnings, 
      int totalMenu, 
      int totalSubmenu, 
      String orderChart, 
      String earningChart}){
    _todayOrder = todayOrder;
    _totalOrder = totalOrder;
    _totalEarnings = totalEarnings;
    _todayEarnings = todayEarnings;
    _totalMenu = totalMenu;
    _totalSubmenu = totalSubmenu;
    _orderChart = orderChart;
    _earningChart = earningChart;
}

  Data.fromJson(dynamic json) {
    _todayOrder = json["today_order"];
    _totalOrder = json["total_order"];
    _totalEarnings = json["total_earnings"];
    _todayEarnings = json["today_earnings"];
    _totalMenu = json["total_menu"];
    _totalSubmenu = json["total_submenu"];
    _orderChart = json["order_chart"];
    _earningChart = json["earning_chart"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["today_order"] = _todayOrder;
    map["total_order"] = _totalOrder;
    map["total_earnings"] = _totalEarnings;
    map["today_earnings"] = _todayEarnings;
    map["total_menu"] = _totalMenu;
    map["total_submenu"] = _totalSubmenu;
    map["order_chart"] = _orderChart;
    map["earning_chart"] = _earningChart;
    return map;
  }

}