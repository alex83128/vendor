import 'package:dio/dio.dart';
import 'package:mealup_restaurant_side/models/common_response.dart';
import 'package:mealup_restaurant_side/models/earning_history_response.dart';
import 'package:mealup_restaurant_side/models/faq_response.dart';
import 'package:mealup_restaurant_side/models/insights_response.dart';
import 'package:mealup_restaurant_side/models/menu.dart';
import 'package:mealup_restaurant_side/models/my_cash_balance_response.dart';
import 'package:mealup_restaurant_side/models/orders_response.dart';
import 'package:mealup_restaurant_side/models/product_customization_response.dart';
import 'package:mealup_restaurant_side/models/product_response.dart';
import 'package:mealup_restaurant_side/models/user.dart';
import 'package:mealup_restaurant_side/models/vendor_detail.dart';
import 'package:mealup_restaurant_side/models/vendor_setting_response.dart';
import 'package:retrofit/retrofit.dart';

import 'apis.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://saasmonks.in/App-Demo/MealUp-76850/public/api/')
abstract class ApiClient {

  factory ApiClient(Dio dio,{String baseUrl}) = _ApiClient;

  @POST(Apis.login)
  @FormUrlEncoded()
  Future<User> login(@Field('email_id') String email,@Field('password') String password,@Field('device_token') String deviceToken);

  @POST(Apis.register)
  @FormUrlEncoded()
  Future<User> register(@Body()  Map<String,String> param);

  @GET(Apis.menu)
  Future<Menu> menu();

  @POST(Apis.createMenu)
  @FormUrlEncoded()
  Future<CommonResponse> createMenu(@Body()  Map<String,String> param);

  @GET('${Apis.subMenu}/{id}')
  Future<ProductResponse> subMenu(@Path() int id);

  @POST(Apis.createSubmenu)
  @FormUrlEncoded()
  Future<CommonResponse> createSubmenu(@Body()  Map<String,String> param);

  @GET(Apis.orders)
  Future<OrdersResponse> orders();

  @GET(Apis.insights)
  Future<InsightsResponse> insights();

  @GET(Apis.cashBalance)
  Future<MyCashBalanceResponse> cashBalance();

  @GET(Apis.earningHistory)
  Future<EarningHistoryResponse> earningHistory();

  @GET(Apis.faq)
  Future<FaqResponse> faq();

  @POST(Apis.changeStatus)
  @FormUrlEncoded()
  Future<CommonResponse> changeStatus(@Body()  Map<String,String> param);


  @GET('${Apis.customization}/{id}')
  Future<ProductCustomizationResponse> getCustomization(
      @Path() int id);

  @POST('${Apis.updateSubmenu}/{id}')
  @FormUrlEncoded()
  Future<CommonResponse> updateSubmenu(@Path() int id , @Body()  Map<String,String> param);

  @POST(Apis.updateProfile)
  @FormUrlEncoded()
  Future<CommonResponse> updateProfile(@Body() Map<String,String> param);

  @GET(Apis.vendorDetail)
  Future<VendorDetail> vendorDetail();

  @GET(Apis.vendorSetting)
  Future<VendorSettingResponse> vendorSetting();

  @POST(Apis.changePassword)
  @FormUrlEncoded()
  Future<CommonResponse> changePassword(@Body() Map<String,String> param);
}

