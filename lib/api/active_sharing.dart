import 'dart:convert';
import 'dart:io';
import 'package:bootcamp_starter/api/api_helper.dart';
import 'package:bootcamp_starter/api/api_message.dart';
import 'package:bootcamp_starter/api/users_api.dart';
import 'package:bootcamp_starter/models/nearest_sender.dart';
import 'package:bootcamp_starter/models/set_active_sharing.dart';
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';

class ActiveSharing {

  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> setActive (String type)async{
    final response =await _helper.post('/activeShare/2', {
      "type": type
    }, {
      HttpHeaders.authorizationHeader: SharedPreController().getValueFor(key: Prefkeys.token.name)??'',
      HttpHeaders.acceptHeader:'application/json'
    });
    var jsonResponse = jsonDecode(response.body);
    if(response.statusCode != 200) {
      return ApiMessage(message: jsonResponse['message'], success: false);
    }
    // return ApiMessage(message: 'Updated successfully', success: true);
    SetActiveSharing setActiveSharing= SetActiveSharing.fromJson(jsonResponse['object']);
    await SharedPreController().setActiveSharing(user_id: setActiveSharing.activeSharing.userId, type: setActiveSharing.activeSharing.type);

  }

  Future<ApiMessage> removeActive ()async{
    final response =await _helper.post('/activeShare/5', {}, {
      HttpHeaders.authorizationHeader: SharedPreController().getValueFor(key: Prefkeys.token.name)??'',
      HttpHeaders.acceptHeader:'application/json'
    });
    if(response['message']=='unauthenticated'){
      return ApiMessage(message: response['message'], success: false);
    }
    return ApiMessage(message: 'Updated successfully', success: true);
  }


  Future<List<String>> nearestSender ()async {
    UsersApi().update_fcm(id: SharedPreController().getValueFor(key: Prefkeys.id.name),fcm: SharedPreController().getValueFor(key: Prefkeys.fcm.name));
    UsersApi().update_location(id: SharedPreController().getValueFor(key: Prefkeys.id.name),lat: SharedPreController().getValueFor(key: Prefkeys.lat.name), long: SharedPreController().getValueFor(key: Prefkeys.long.name));
    final response = await _helper.post('/activeShare/nearest/1', {}, {
      HttpHeaders.authorizationHeader: SharedPreController().getValueFor(
          key: Prefkeys.token.name) ?? '',
      HttpHeaders.acceptHeader: 'application/json'
    });
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (jsonResponse['object'] != null) {
        NearestSender nearestSender = NearestSender.fromJson(
            jsonResponse['object']);
        if (nearestSender.nearestUsers != null) {
          List<String> senderNames = nearestSender.nearestUsers!.map((
              sender) => sender.name).toList();
          // return nearestSender.nearestUsers;
          await SharedPreController().nearest_sender(
              count: nearestSender.count,
              nearest_users: senderNames);
          return senderNames;
        }
        return <String>[];
      }
    }
    return <String>[];
  }
}