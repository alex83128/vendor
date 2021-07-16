/// success : true
/// data : {"id":188,"name":"resto","image":"https://saasmonks.in/App-Demo/MealUp-76850/public/images/upload/noimage.jpg","email_id":"rest123@gmail.com","email_verified_at":null,"device_token":null,"phone":"1234567890","phone_code":"+91","is_verified":1,"status":1,"otp":null,"faviroute":null,"vendor_id":null,"language":null,"ifsc_code":null,"account_name":null,"account_number":null,"micr_code":null,"created_at":"2021-05-31T05:58:17.000000Z","updated_at":"2021-05-31T05:58:17.000000Z","token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMGYxMmIzY2I0Zjk0MWY0Y2UxZDU2ODA4YTAyOWRlYzRmODNjMTI3OTZlYmY3NDZkOWEwZjAzZTYzZTJhMDdiMGUzNjlmYmUyYTYzNGM2ZmEiLCJpYXQiOiIxNjIyNDQwNzE0LjUxMTc2NiIsIm5iZiI6IjE2MjI0NDA3MTQuNTExNzcwIiwiZXhwIjoiMTY1Mzk3NjcxNC41MDc2NTUiLCJzdWIiOiIxODgiLCJzY29wZXMiOltdfQ.q0PG4XWht3Q5OmqU4B7YoDPokH28w5H6nyIHu3g5ogQiplZv7xxj4J3cy0THihcZBHiTzMojKUUTIx1vdW-u-p2FuRouGpjqk-wBOge5HOuPGPmxw0D0zeaqf9NU1Ww-wJsrgWeku88955WhP079_LVwKSKNQG1sUdT319A4CpD2x61EJ1l9SFl-P5ozE-vLXRueTKAkYLTTxoLNMaXZZ5YlmALlbbxpqowqNo5atx_t_Ea-_20tkGwg16E-EXVYzPuAOQdZVO8fD5hGmGF8aHiP8skhE2BXeosjrvV3-ibC62rRBI2y3NIJHXkxPkGRILY3MUpDzi8gFWawX-EmqSh3RTgXTH8ioUDbrAki56iUHEfqy_3VUerXgVScwUv3erRQphkx-yDviSJojHdmo-Bw0zC6Onx7cYF7VdPUNq3AZtaw2R_4LHqw6TZ_9rTIlZn3ONIDPMIq6_ea78alWDvMP4BA9eVxN6Be_lQ8agoANPJAklfTHRzzT8w7_2rGtpnyYyFJRH2WS-g-DBe8LTEAXVFwrSppAjKyQvVzrUk5GlQj63M4D1YTRG6Xy47mjk-qTdjBpMuToU0TahrQRS5wZhwvImrjAvRnZeWEfMBI7I6LBU484sYoiPhF9_o16js9yEe-QHDGwwVTtEUyA3xJDrkO2MFDTvPCUvB1h9U","roles":[{"id":4,"title":"vendor","created_at":"2020-11-03T01:14:54.000000Z","updated_at":"2020-11-03T01:14:54.000000Z","pivot":{"user_id":188,"role_id":4}}]}

class User {
  bool _success;
  Data _data;

  bool get success => _success;
  Data get data => _data;

  User({bool success, Data data}){
    _success = success;
    _data = data;
}

  User.fromJson(dynamic json) {
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

/// id : 188
/// name : "resto"
/// image : "https://saasmonks.in/App-Demo/MealUp-76850/public/images/upload/noimage.jpg"
/// email_id : "rest123@gmail.com"
/// email_verified_at : null
/// device_token : null
/// phone : "1234567890"
/// phone_code : "+91"
/// is_verified : 1
/// status : 1
/// otp : null
/// faviroute : null
/// vendor_id : null
/// language : null
/// ifsc_code : null
/// account_name : null
/// account_number : null
/// micr_code : null
/// created_at : "2021-05-31T05:58:17.000000Z"
/// updated_at : "2021-05-31T05:58:17.000000Z"
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMGYxMmIzY2I0Zjk0MWY0Y2UxZDU2ODA4YTAyOWRlYzRmODNjMTI3OTZlYmY3NDZkOWEwZjAzZTYzZTJhMDdiMGUzNjlmYmUyYTYzNGM2ZmEiLCJpYXQiOiIxNjIyNDQwNzE0LjUxMTc2NiIsIm5iZiI6IjE2MjI0NDA3MTQuNTExNzcwIiwiZXhwIjoiMTY1Mzk3NjcxNC41MDc2NTUiLCJzdWIiOiIxODgiLCJzY29wZXMiOltdfQ.q0PG4XWht3Q5OmqU4B7YoDPokH28w5H6nyIHu3g5ogQiplZv7xxj4J3cy0THihcZBHiTzMojKUUTIx1vdW-u-p2FuRouGpjqk-wBOge5HOuPGPmxw0D0zeaqf9NU1Ww-wJsrgWeku88955WhP079_LVwKSKNQG1sUdT319A4CpD2x61EJ1l9SFl-P5ozE-vLXRueTKAkYLTTxoLNMaXZZ5YlmALlbbxpqowqNo5atx_t_Ea-_20tkGwg16E-EXVYzPuAOQdZVO8fD5hGmGF8aHiP8skhE2BXeosjrvV3-ibC62rRBI2y3NIJHXkxPkGRILY3MUpDzi8gFWawX-EmqSh3RTgXTH8ioUDbrAki56iUHEfqy_3VUerXgVScwUv3erRQphkx-yDviSJojHdmo-Bw0zC6Onx7cYF7VdPUNq3AZtaw2R_4LHqw6TZ_9rTIlZn3ONIDPMIq6_ea78alWDvMP4BA9eVxN6Be_lQ8agoANPJAklfTHRzzT8w7_2rGtpnyYyFJRH2WS-g-DBe8LTEAXVFwrSppAjKyQvVzrUk5GlQj63M4D1YTRG6Xy47mjk-qTdjBpMuToU0TahrQRS5wZhwvImrjAvRnZeWEfMBI7I6LBU484sYoiPhF9_o16js9yEe-QHDGwwVTtEUyA3xJDrkO2MFDTvPCUvB1h9U"
/// roles : [{"id":4,"title":"vendor","created_at":"2020-11-03T01:14:54.000000Z","updated_at":"2020-11-03T01:14:54.000000Z","pivot":{"user_id":188,"role_id":4}}]

class Data {
  int _id;
  dynamic _name;
  String _image;
  String _emailId;
  dynamic _emailVerifiedAt;
  dynamic _deviceToken;
  String _phone;
  String _phoneCode;
  int _isVerified;
  int _status;
  dynamic _otp;
  dynamic _faviroute;
  dynamic _vendorId;
  dynamic _language;
  dynamic _ifscCode;
  dynamic _accountName;
  dynamic _accountNumber;
  dynamic _micrCode;
  String _createdAt;
  String _updatedAt;
  String _token;
  List<Roles> _roles;

  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get emailId => _emailId;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get deviceToken => _deviceToken;
  String get phone => _phone;
  String get phoneCode => _phoneCode;
  int get isVerified => _isVerified;
  int get status => _status;
  dynamic get otp => _otp;
  dynamic get faviroute => _faviroute;
  dynamic get vendorId => _vendorId;
  dynamic get language => _language;
  dynamic get ifscCode => _ifscCode;
  dynamic get accountName => _accountName;
  dynamic get accountNumber => _accountNumber;
  dynamic get micrCode => _micrCode;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  String get token => _token;
  List<Roles> get roles => _roles;

  Data({
      int id, 
      String name, 
      String image, 
      String emailId, 
      dynamic emailVerifiedAt, 
      dynamic deviceToken, 
      String phone, 
      String phoneCode, 
      int isVerified, 
      int status, 
      dynamic otp, 
      dynamic faviroute, 
      dynamic vendorId, 
      dynamic language, 
      dynamic ifscCode, 
      dynamic accountName, 
      dynamic accountNumber, 
      dynamic micrCode, 
      String createdAt, 
      String updatedAt, 
      String token, 
      List<Roles> roles}){
    _id = id;
    _name = name;
    _image = image;
    _emailId = emailId;
    _emailVerifiedAt = emailVerifiedAt;
    _deviceToken = deviceToken;
    _phone = phone;
    _phoneCode = phoneCode;
    _isVerified = isVerified;
    _status = status;
    _otp = otp;
    _faviroute = faviroute;
    _vendorId = vendorId;
    _language = language;
    _ifscCode = ifscCode;
    _accountName = accountName;
    _accountNumber = accountNumber;
    _micrCode = micrCode;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _token = token;
    _roles = roles;
}

  Data.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _image = json["image"];
    _emailId = json["email_id"];
    _emailVerifiedAt = json["email_verified_at"];
    _deviceToken = json["device_token"];
    _phone = json["phone"];
    _phoneCode = json["phone_code"];
    _isVerified = json["is_verified"];
    _status = json["status"];
    _otp = json["otp"];
    _faviroute = json["faviroute"];
    _vendorId = json["vendor_id"];
    _language = json["language"];
    _ifscCode = json["ifsc_code"];
    _accountName = json["account_name"];
    _accountNumber = json["account_number"];
    _micrCode = json["micr_code"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _token = json["token"];
    if (json["roles"] != null) {
      _roles = [];
      json["roles"].forEach((v) {
        _roles.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["image"] = _image;
    map["email_id"] = _emailId;
    map["email_verified_at"] = _emailVerifiedAt;
    map["device_token"] = _deviceToken;
    map["phone"] = _phone;
    map["phone_code"] = _phoneCode;
    map["is_verified"] = _isVerified;
    map["status"] = _status;
    map["otp"] = _otp;
    map["faviroute"] = _faviroute;
    map["vendor_id"] = _vendorId;
    map["language"] = _language;
    map["ifsc_code"] = _ifscCode;
    map["account_name"] = _accountName;
    map["account_number"] = _accountNumber;
    map["micr_code"] = _micrCode;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    map["token"] = _token;
    if (_roles != null) {
      map["roles"] = _roles.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// title : "vendor"
/// created_at : "2020-11-03T01:14:54.000000Z"
/// updated_at : "2020-11-03T01:14:54.000000Z"
/// pivot : {"user_id":188,"role_id":4}

class Roles {
  int _id;
  String _title;
  String _createdAt;
  String _updatedAt;
  Pivot _pivot;

  int get id => _id;
  String get title => _title;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  Pivot get pivot => _pivot;

  Roles({
      int id, 
      String title, 
      String createdAt, 
      String updatedAt, 
      Pivot pivot}){
    _id = id;
    _title = title;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pivot = pivot;
}

  Roles.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
    _pivot = json["pivot"] != null ? Pivot.fromJson(json["pivot"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["created_at"] = _createdAt;
    map["updated_at"] = _updatedAt;
    if (_pivot != null) {
      map["pivot"] = _pivot.toJson();
    }
    return map;
  }

}

/// user_id : 188
/// role_id : 4

class Pivot {
  int _userId;
  int _roleId;

  int get userId => _userId;
  int get roleId => _roleId;

  Pivot({
      int userId, 
      int roleId}){
    _userId = userId;
    _roleId = roleId;
}

  Pivot.fromJson(dynamic json) {
    _userId = json["user_id"];
    _roleId = json["role_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["user_id"] = _userId;
    map["role_id"] = _roleId;
    return map;
  }

}