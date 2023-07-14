import 'package:bootcamp_starter/models/r_user.dart';
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
    if( Regisered_user.fromJson(response).token != null) {
      String name = Regisered_user.fromJson(response).user!.name!;
      String email = Regisered_user.fromJson(response).user!.email;
      String createdAt = Regisered_user.fromJson(response).user!.createdAt;
      String updatedAt = Regisered_user.fromJson(response).user!.updatedAt;
      String token = Regisered_user.fromJson(response).token!;
      int id = Regisered_user.fromJson(response).user!.id;
      R_User user = R_User(name,email,updatedAt,createdAt,id);
      Regisered_user regisered_user = Regisered_user(user: user , token: token);
      SharedPreController().save_user(user: regisered_user);

    }

  }

  Future<void> register({required String name , required String email , required String password}) async {
    final response = await _helper.post("/register", {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password
    }, {});
    if (Regisered_user.fromJson(response).token != null) {
      String name = Regisered_user.fromJson(response).user!.name!;
      String email = Regisered_user.fromJson(response).user!.email;
      String createdAt = Regisered_user.fromJson(response).user!.createdAt;
      String updatedAt = Regisered_user.fromJson(response).user!.updatedAt;
      String token = Regisered_user.fromJson(response).token!;
      int id = Regisered_user.fromJson(response).user!.id;
       R_User user = R_User(name,email,updatedAt,createdAt,id);
       Regisered_user regisered_user = Regisered_user(user: user , token: token);
       SharedPreController().save_user(user: regisered_user);
    }
  }
}
