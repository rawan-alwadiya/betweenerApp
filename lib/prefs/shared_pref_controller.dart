
import 'package:bootcamp_starter/models/register_user.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum Prefkeys
{id,loggedIn,name, email, password, token,updated_at , created_at ,lat ,long,fcm}
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



  Future<void> save_user({required Regisered_user user})async{
     await _sharedPreferences.setInt(Prefkeys.id.name, user.user!.id!);
     await _sharedPreferences.setString(Prefkeys.name.name, user.user!.name!);
     await _sharedPreferences.setString(Prefkeys.email.name, user.user!.email!);
     await _sharedPreferences.setString(Prefkeys.updated_at.name, user.user!.updatedAt!);
     await _sharedPreferences.setString(Prefkeys.created_at.name, user.user!.createdAt!);
     await _sharedPreferences.setDouble(Prefkeys.lat.name, user.user!.lat ?? 0);
     await _sharedPreferences.setDouble(Prefkeys.long.name, user.user!.long ?? 0);
     await _sharedPreferences.setString(Prefkeys.fcm.name, user.user!.fcm ?? '');
     await _sharedPreferences.setString(Prefkeys.token.name, user.token ?? '');

  }


  T? getValueFor<T>({required String key}){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null ;
  }


  Future<bool> clear() async => await _sharedPreferences.clear();
}