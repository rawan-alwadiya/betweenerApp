import 'package:bootcamp_starter/models/r_user.dart';

class Regisered_user {
  String? message;
  R_User? user;
  String? token;

  Regisered_user({this.message, this.user, this.token});

  Regisered_user.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new R_User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

