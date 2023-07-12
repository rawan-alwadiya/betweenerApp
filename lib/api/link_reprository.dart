import 'package:bootcamp_starter/models/link.dart';
import '../models/link_response.dart';
import '../prefs/shared_pref_controller.dart';
import 'api_helper.dart';

class LinkRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  //example - you can use cashed user token
  String userToken = SharedPreController().getValueFor<String>(key: Prefkeys.token.name)?? '';
  Future<List<Link>> fetchLinkList() async {
    final response = await _helper.get("/links", {
      'Authorization': 'Bearer $userToken',
    });

    return LinkResponse.fromJson(response).results;
  }

  Future<dynamic> addLink({required String title , required String link , required String username , required String isActive}) async {
    final response = await _helper.post("/links", {
      'title': title ,
      'link' : link,
      'username' : username,
      'isActive': isActive
    },
        {'Authorization': 'Bearer $userToken',});
    return LinkResponse.fromJson(response).results;
  }
  Future<dynamic> updateLink({ required int? id , required String title , required String link , required String username , required String isActive , }) async {
    final response = await _helper.put("/links/$id", {
      'title': title ,
      'link' : link,
      'username' : username,
      'isActive': isActive

    },
        {'Authorization': 'Bearer $userToken',});
    return LinkResponse.fromJson(response).results;
  }
  Future<dynamic> deleteLink({required int? id}) async {
    final response = await _helper.delete("/links/$id",
        {'Authorization': 'Bearer $userToken',});
  }
}