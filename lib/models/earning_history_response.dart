import 'package:mealup_restaurant_side/retrofit/api_client.dart';
import 'package:mealup_restaurant_side/retrofit/api_header.dart';
import 'package:mealup_restaurant_side/retrofit/base_model.dart';
import 'package:mealup_restaurant_side/retrofit/server_error.dart';

/// success : true
/// data : {"total_balance":0,"today_earning":0,"weekly_earning":0,"yearly_earning":0,"order_chart":"{\"data\":[1,0,0,0,0,0,0,0,0,0,0,0],\"label\":[\"Jun-21\",\"May-21\",\"Apr-21\",\"Mar-21\",\"Feb-21\",\"Jan-21\",\"Dec-20\",\"Nov-20\",\"Oct-20\",\"Sep-20\",\"Aug-20\",\"Jul-20\"]}"}

Future<BaseModel<EarningHistoryResponse>> getEarningHistory() async {
  EarningHistoryResponse response;
  try {
    response = await ApiClient(ApiHeader().dioData()).earningHistory();
  } catch (error, stacktrace) {
    print("Exception occur: $error stackTrace: $stacktrace");
    return BaseModel()..setException(ServerError.withError(error: error));
  }
  return BaseModel()..data = response;
}

class EarningHistoryResponse {
  bool _success;
  Data _data;

  bool get success => _success;
  Data get data => _data;

  EarningHistoryResponse({
      bool success, 
      Data data}){
    _success = success;
    _data = data;
}

  EarningHistoryResponse.fromJson(dynamic json) {
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

/// total_balance : 0
/// today_earning : 0
/// weekly_earning : 0
/// yearly_earning : 0
/// order_chart : "{\"data\":[1,0,0,0,0,0,0,0,0,0,0,0],\"label\":[\"Jun-21\",\"May-21\",\"Apr-21\",\"Mar-21\",\"Feb-21\",\"Jan-21\",\"Dec-20\",\"Nov-20\",\"Oct-20\",\"Sep-20\",\"Aug-20\",\"Jul-20\"]}"

class Data {
  int _totalBalance;
  int _todayEarning;
  int _weeklyEarning;
  int _yearlyEarning;
  String _orderChart;

  int get totalBalance => _totalBalance;
  int get todayEarning => _todayEarning;
  int get weeklyEarning => _weeklyEarning;
  int get yearlyEarning => _yearlyEarning;
  String get orderChart => _orderChart;

  Data({
      int totalBalance, 
      int todayEarning, 
      int weeklyEarning, 
      int yearlyEarning, 
      String orderChart}){
    _totalBalance = totalBalance;
    _todayEarning = todayEarning;
    _weeklyEarning = weeklyEarning;
    _yearlyEarning = yearlyEarning;
    _orderChart = orderChart;
}

  Data.fromJson(dynamic json) {
    _totalBalance = json["total_balance"];
    _todayEarning = json["today_earning"];
    _weeklyEarning = json["weekly_earning"];
    _yearlyEarning = json["yearly_earning"];
    _orderChart = json["order_chart"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["total_balance"] = _totalBalance;
    map["today_earning"] = _todayEarning;
    map["weekly_earning"] = _weeklyEarning;
    map["yearly_earning"] = _yearlyEarning;
    map["order_chart"] = _orderChart;
    return map;
  }

}