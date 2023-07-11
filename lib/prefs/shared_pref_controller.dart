import 'package:bootcamp_starter/models/Users.dart';
import 'package:shared_preferences/shared_preferences.dart';
enum Prefkeys{id,loggedIn,name, email, password, token}
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

  Future<void> save({required Users user}) async{
    await _sharedPreferences.setBool(Prefkeys.loggedIn.name, true);
    await _sharedPreferences.setInt(Prefkeys.id.name, user.id);
    await _sharedPreferences.setString(Prefkeys.name.name, user.name);
    await _sharedPreferences.setString(Prefkeys.email.name, user.email);
    await _sharedPreferences.setString(Prefkeys.token.name, 'Bearer ${user.token}');
  }


  T? getValueFor<T>({required String key}){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }


  Future<bool> clear() async => await _sharedPreferences.clear();
}