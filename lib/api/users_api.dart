
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';

import '../models/r_user.dart';
import '../models/register_user.dart';
import 'api_helper.dart';

class UsersApi {
  final ApiBaseHelper _helper = ApiBaseHelper();


  String userToken = SharedPreController().getValueFor<String>(key: Prefkeys.token.name)!;

  Future<void> update_location({ required int id, required String lat , required String long}) async {
    final response = await _helper.put("/update/$id", {
      'lat':lat,
      'long':long
    },
        {
      'Authorization': 'Bearer $userToken',
    });
    if(Regisered_user.fromJson(response).token != null){
      String name = SharedPreController().getValueFor(key: Prefkeys.name.name);
      String email = SharedPreController().getValueFor(key: Prefkeys.email.name);
      String updatedAt = SharedPreController().getValueFor(key: Prefkeys.updated_at.name);
      String createdAt = SharedPreController().getValueFor(key: Prefkeys.created_at.name);
      int id = SharedPreController().getValueFor(key: Prefkeys.id.name);
      String token = SharedPreController().getValueFor(key: Prefkeys.token.name);
      R_User user = R_User(name,email,updatedAt,createdAt,id,
      lat: (Regisered_user.fromJson(response).user!.lat)?.toDouble() ,
        long: (Regisered_user.fromJson(response).user!.long)?.toDouble() ,
      );
      Regisered_user regisered_user = Regisered_user(user: user , token: token);
      SharedPreController().save_user(user: regisered_user);


    }
  }

  Future<void> update_fcm({ required int id ,required String fcm}) async {
    final response = await _helper.put("/fcm/$id", {
      'fcm':fcm,
    },
        {
          'Authorization': 'Bearer $userToken',
        });


  }
}