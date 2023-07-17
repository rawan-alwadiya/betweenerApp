
import 'package:bootcamp_starter/api/api_helper.dart';

import '../models/search_model.dart';
import '../prefs/shared_pref_controller.dart';

class SearchRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String userToken = SharedPreController().getValueFor<String>(key: Prefkeys.token.name) ?? '';

  Future<dynamic> searchByName() async {
    final response = await _helper.post("/search", {
      'name':'dina',
    },
      {'Authorization': 'Bearer $userToken'},);
    print(SearchResponse.fromJson(response).user);
    return SearchResponse.fromJson(response).user;

  }
}
