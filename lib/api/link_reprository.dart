import 'dart:io';

import 'package:bootcamp_starter/models/link.dart';
import '../models/link_response.dart';
import '../prefs/shared_pref_controller.dart';
import 'api_helper.dart';
import 'package:http/http.dart' as http;

class LinkRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final String _baseUrl = "http://osamapro.online/api";

  //example - you can use cashed user token
  String userToken = SharedPreController().getValueFor<String>(key: Prefkeys.token.name)?? '';

  Future<List<Link>> fetchLinkList() async {
    final response = await _helper.get("/links", {
      'Authorization': 'Bearer $userToken',
    });

    return LinkResponse.fromJson(response).results;
  }

  Future<bool> isTokenActive()async{
    Uri uri = Uri.parse(_baseUrl+'/links');
    var response = await http.post(uri ,headers: {
      HttpHeaders.authorizationHeader: SharedPreController().getValueFor(key: Prefkeys.token.name)??'',
      HttpHeaders.acceptHeader:'application/json'
    });
    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
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