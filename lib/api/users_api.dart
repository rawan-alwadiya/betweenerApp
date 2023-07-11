import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';
import '../models/User.dart';
import 'api_helper.dart';

class UsersApi {
  final ApiBaseHelper _helper = ApiBaseHelper();


  String userToken = SharedPreController().getValueFor<String>(key: Prefkeys.token.name)!;

  Future<void> update_location({ required String lat , required String long}) async {
    final response = await _helper.put("/update/1", {
      'lat':lat,
      'long':long
    },
        {
      'Authorization': 'Bearer $userToken',
    });
  }

  Future<void> update_fcm({required String fcm}) async {
    final response = await _helper.put("/fcm/1", {
      'fcm':fcm,
    },
        {
          'Authorization': 'Bearer $userToken',
        });
    print(User.fromJson(response).fcm);

  }
}