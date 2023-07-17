import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';
import 'api_helper.dart';
import '../models/followers_model.dart';

class FollowerRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String userToken = SharedPreController().getValueFor<String>(key: Prefkeys.token.name) ?? '';

  Future<List<Followers>?> addFollower() async {
    final response = await _helper.post("/follow", {
      'followee_id': '24'
    }, {
      'Authorization': 'Bearer $userToken',
    });
    return FollowerResponse.fromJson(response).followers;
  }



  Future<FollowerResponse> fetchFollower() async {
    final response = await _helper.get("/follow", {
      'Authorization': 'Bearer $userToken',
    });
    return FollowerResponse.fromJson(response);
  }



}
