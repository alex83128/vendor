import 'package:mealup_restaurant_side/constant/common_function.dart';
import 'package:mealup_restaurant_side/retrofit/api_client.dart';
import 'package:mealup_restaurant_side/retrofit/api_header.dart';
import 'package:mealup_restaurant_side/retrofit/base_model.dart';
import 'package:mealup_restaurant_side/retrofit/server_error.dart';

/// success : true
/// data : "Menu Cretaed successfully...!!"

Future<BaseModel<CommonResponse>> addMenu(Map<String, String> param) async {
  CommonResponse response;
  try {
    response = await ApiClient(ApiHeader().dioData()).createMenu(param);

  } catch (error, stacktrace) {
    print("Exception occurred: $error stackTrace: $stacktrace");
    return BaseModel()..setException(ServerError.withError(error: error));
  }
  return BaseModel()..data = response;
}

Future<BaseModel<CommonResponse>> addProduct(Map<String, String> param) async {
  CommonResponse response;
  try {
    response = await ApiClient(ApiHeader().dioData()).createSubmenu(param);
  } catch (error, stacktrace) {
    print("Exception occurred: $error stackTrace: $stacktrace");
    return BaseModel()..setException(ServerError.withError(error: error));
  }
  return BaseModel()..data = response;

}

Future<BaseModel<CommonResponse>> changeOrderStatus(Map<String, String> param) async {
  CommonResponse response;
  try {
    response = await ApiClient(ApiHeader().dioData()).changeStatus(param);
    CommonFunction.toastMessage(response.data.toString());
  } catch (error, stacktrace) {
    print("Exception occurred: $error stackTrace: $stacktrace");
    return BaseModel()..setException(ServerError.withError(error: error));
  }
  return BaseModel()..data = response;
}

Future<BaseModel<CommonResponse>> updateSubmenu( int id,Map<String, String> param,) async {
  CommonResponse response;
  try {
    response = await ApiClient(ApiHeader().dioData()).updateSubmenu(id,param);
    CommonFunction.toastMessage(response.data.toString());
  } catch (error, stacktrace) {
    print("Exception occurred: $error stackTrace: $stacktrace");
    return BaseModel()..setException(ServerError.withError(error: error));
  }
  return BaseModel()..data = response;
}

Future<BaseModel<CommonResponse>> updateProfileVendor(Map<String, String> param) async {
  CommonResponse response;
  try {
    response = await ApiClient(ApiHeader().dioData()).updateProfile(param);
    CommonFunction.toastMessage(response.data.toString());
  } catch (error, stacktrace) {
    print("Exception occurred: $error stackTrace: $stacktrace");
    return BaseModel()..setException(ServerError.withError(error: error));
  }
  return BaseModel()..data = response;
}

Future<BaseModel<CommonResponse>> changePassword(Map<String, String> param) async {
  CommonResponse response;
  try {
    response = await ApiClient(ApiHeader().dioData()).changePassword(param);
    CommonFunction.toastMessage(response.data.toString());
  } catch (error, stacktrace) {
    print("Exception occurred: $error stackTrace: $stacktrace");
    return BaseModel()..setException(ServerError.withError(error: error));
  }
  return BaseModel()..data = response;
}

class CommonResponse {
  bool _success;
  String _data;

  bool get success => _success;
  String get data => _data;

  CommonResponse({
      bool success, 
      String data}){
    _success = success;
    _data = data;
}

  CommonResponse.fromJson(dynamic json) {
    _success = json["success"];
    _data = json["data"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = _success;
    map["data"] = _data;
    return map;
  }

}

