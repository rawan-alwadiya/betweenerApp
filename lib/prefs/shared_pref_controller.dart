
import 'package:bootcamp_starter/models/register_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models/register_user.dart';


enum Prefkeys
{id,loggedIn,name, email, password, token,updated_at , created_at}
class SharedPreController {
  SharedPreController._();

  late SharedPreferences _sharedPreferences;
  static SharedPreController? _instance;

  factory SharedPreController(){
    return _instance ??= SharedPreController._();

  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Future<void> save({required User user}) async{
  //   await _sharedPreferences.setBool(Prefkeys.loggedIn.name, true);
  //   await _sharedPreferences.setInt(Prefkeys.id.name, user.id!);
  //   await _sharedPreferences.setString(Prefkeys.name.name, user.name!);
  //   await _sharedPreferences.setString(Prefkeys.email.name, user.email!);
  // }
  //  Future<void> save({required String token}) async{
  //    await _sharedPreferences.setString(Prefkeys.token.name, regiser_user().token!);
  //  }
  // Future<void> save2({required String token}) async{
  //   await _sharedPreferences.setString(Prefkeys.token.name, login_user().token!);
  // }

  Future<void> save_user({required Regisered_user user})async{
    await _sharedPreferences.setInt(Prefkeys.id.name, Regisered_user().user!.id!);
    await _sharedPreferences.setString(Prefkeys.name.name, Regisered_user().user!.name!);
    await _sharedPreferences.setString(Prefkeys.email.name, Regisered_user().user!.email!);
    await _sharedPreferences.setString(Prefkeys.updated_at.name, Regisered_user().user!.updatedAt!);
    await _sharedPreferences.setString(Prefkeys.created_at.name, Regisered_user().user!.createdAt!);
    await _sharedPreferences.setString(Prefkeys.token.name, Regisered_user().token!);
  }
  Future<void> update_token({required String token})async{
    await _sharedPreferences.setString(Prefkeys.token.name, Regisered_user().token!);
  }



  T? getValueFor<T>({required String key}){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }


  Future<bool> clear() async => await _sharedPreferences.clear();
}