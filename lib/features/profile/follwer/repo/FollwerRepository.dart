
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';

import '../../../../api/api_helper.dart';
import '../models/follwers_model.dart';

class FollwerRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String userToken = SharedPreController().getValueFor<String>(key: Prefkeys.token.name) ?? '';

  ///////////////////////////////////////////////////////////////////////////////
//add follwer
  Future<List<Followers>?> addFollwer() async {
    final response = await _helper.post("/follow", {
      'followee_id': '24'
    }, {
      'Authorization': 'Bearer $userToken',
    });
    return FollwerResponse.fromJson(response).followers;
  }

  ///////////////////////////////////////////////////////////////////////////////

// get follwer
  //هذه بس بترجع follwing
  // Future<List<Following>?> fetchFollwing() async {
  //   final response = await _helper.get("/follow", {
  //     'Authorization': 'Bearer $userToken',
  //   });
  //   return FollwerResponse.fromJson(response).following;
  // }

  Future<FollwerResponse> fetchFollwer() async {
    final response = await _helper.get("/follow", {
      'Authorization': 'Bearer $userToken',
    });
    return FollwerResponse.fromJson(response);
  }
  // Future<List<Followers>?> fetchFollwer() async {
  //   final response = await _helper.get("/follow", {
  //     'Authorization': 'Bearer $userToken',
  //   });
  //   return FollwerResponse.fromJson(response).followers;
  // }


}
