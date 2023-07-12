
import 'package:bootcamp_starter/api/api_helper.dart';

import '../models/search_model.dart';

class SearchRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String userToken = '141|IuPYijywRe3lqiqY9Q1VXfmznAyXfyO4CAetFETH';

  Future<dynamic> searchByName() async {
    final response = await _helper.post("/search", {
      'name':'ali',
    },
      {'Authorization': 'Bearer $userToken'},);
     print('Result Search');
     print('Result Search');
     print('Result Search');
     print('Result Search');
     print('Result Search');
     print('Result Search');
     print('Result Search');
     print('Result Search');
     print('Result Search');
     print('Result Search');
     print('Result Search');
     print('Result Search');
    print(SearchResponse.fromJson(response).user);
    return SearchResponse.fromJson(response).user;

  }
}
