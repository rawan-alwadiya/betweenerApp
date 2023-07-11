

import 'package:bootcamp_starter/models/login_user.dart';
import 'package:bootcamp_starter/models/register_user.dart';

import '../prefs/shared_pref_controller.dart';
import 'api_helper.dart';

class AuthApi {
  final ApiBaseHelper _helper = ApiBaseHelper();


  Future<void> login({ required String email , required String password }) async {
    final response = await _helper.post("/login", {
      'email' : email ,
      'password': password
    },{});
    if( login_user.fromJson(response).token != null){
      print(login_user.fromJson(response).token );
      SharedPreController().save(login_user.fromJson(response).token);
    }


  }

  Future<void> register({required String name , required String email , required String password}) async {
    final response = await _helper.post("/register", {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password
    }, {});
    if (regiser_user.fromJson(response).token != null) {
      print(regiser_user.fromJson(response).token);
      SharedPreController().save(login_user.fromJson(response).token);


    }
  }
}
