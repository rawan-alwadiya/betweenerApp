import 'package:shared_preferences/shared_preferences.dart';
enum Prefkeys{
   token
}
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

  void save( String? token) async {
    await _sharedPreferences.setString(Prefkeys.token.name, 'Bearer ${token}');
  }
  T? getValueFor<T>({required String key}){
    if(_sharedPreferences.containsKey(key)){
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }


  Future<bool> clear() async => await _sharedPreferences.clear();
}