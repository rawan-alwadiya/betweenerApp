//
// import 'package:bootcamp_starter/api/api_message.dart';
// import 'package:bootcamp_starter/models/Users.dart';
// import '../prefs/shared_pref_controller.dart';
// import 'api_helper.dart';
//
// class AuthApi {
//   final ApiBaseHelper _helper = ApiBaseHelper();
//
//
//   Future<ApiMessage> login({ required String email , required String password }) async {
//     final response = await _helper.post("/login", {
//       'email': email,
//       'password': password
//     }, {});
//     // if (User.fromJson(response['token']) != null) {
//       // print(login_user.fromJson(response).token );
//       User user = User.fromJson(response);
//       if(user !=null ){
//       SharedPreController().save(user: user);
//       return ApiMessage(message: 'Login has been successfully', success: true);
//
//     }else{
//       return ApiMessage(message: 'Login failed!', success: false);
//     }
//   }
//
//   Future<ApiMessage> register({required String name , required String email , required String password}) async {
//     final response = await _helper.post("/register", {
//       'name': name,
//       'email': email,
//       'password': password,
//       'password_confirmation': password
//     }, {});
//     if(response['message']=='something wrong'){
//       return ApiMessage(message: response['message'], success: false);
//     }else{
//       return ApiMessage(message: 'Register has been successfully', success: true);
//     }
//   }
//   }
//
import 'package:bootcamp_starter/api/api_message.dart';
import 'package:bootcamp_starter/models/Users.dart';
import 'package:bootcamp_starter/models/login_user.dart';
import 'package:bootcamp_starter/models/Users.dart';
import '../prefs/shared_pref_controller.dart';
import 'api_helper.dart';

class AuthApi {
  final ApiBaseHelper _helper = ApiBaseHelper();

  // Future<ApiMessage> login({required String email, required String password}) async {
  //   final response = await _helper.post("/login", {
  //     'email': email,
  //     'password': password
  //   }, {});
  //   if (response['user'] != null && response['token'] != null) {
  //     // User u = User();
  //     var user = User.fromJson(response['user']);
  //     SharedPreController().save(user: user);
  //     return ApiMessage(message: 'Login has been successfully', success: true);
  //
  //   }else{
  //     return ApiMessage(message: 'Login failed!', success: false);
  //   }
  // }

  Future<ApiMessage> login({required String email, required String password}) async {
    final response = await _helper.post("/login", {
      'email': email,
      'password': password,
    }, {});
    if (response['user'] != null && response['token'] != null) {
      var user = Users.fromJson(response['user']);
      SharedPreController().save(user: user);
      return ApiMessage(message: 'Login has been successfully', success: true);
    } else {
      return ApiMessage(message: 'Login failed!', success: false);
    }
  }

  Future<ApiMessage> register({required String name, required String email, required String password}) async {
    final response = await _helper.post("/register", {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password
    }, {});
    if(response['message']=='something wrong'){
      return ApiMessage(message: response['message'], success: false);
    } else {
      return ApiMessage(message: 'Register has been successful', success: true);
    }
  }
}
