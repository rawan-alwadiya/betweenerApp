import 'Users.dart';

class login_user {
  Users? user;
  String? token;

  login_user({this.user, this.token});

  login_user.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new Users.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

