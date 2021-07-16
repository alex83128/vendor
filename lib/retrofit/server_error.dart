import 'package:dio/dio.dart' hide Headers;
import 'package:mealup_restaurant_side/constant/common_function.dart';

class ServerError implements Exception {
  int _errorCode;
  String _errorMessage = "";

  ServerError.withError({DioError error}) {
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        _errorMessage = "Request was cancelled";
        CommonFunction.toastMessage('Request was cancelled');
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        _errorMessage = "Connection timeout";
        CommonFunction.toastMessage('Connection timeout');
        break;
      case DioErrorType.DEFAULT:
        _errorMessage =
        "Connection failed due to internet connection";
        CommonFunction.toastMessage('Connection failed due to internet connection');
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        _errorMessage = "Receive timeout in connection";
        CommonFunction.toastMessage('Receive timeout in connection');
        break;
      case DioErrorType.RESPONSE:
        _errorMessage = "Received invalid status code: ${error.response.data}";
        try{
          CommonFunction.toastMessage(error.response.data['message'].toString());
        }catch (error1, stacktrace) {
          CommonFunction.toastMessage(error.response.data.toString());
          print("Exception occurred: $error stackTrace: $stacktrace apiError: ${error.response.data}"  );
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        _errorMessage = "Receive timeout in send request";
        CommonFunction.toastMessage('Receive timeout in send request');
        break;
    }
    return _errorMessage;
  }
}