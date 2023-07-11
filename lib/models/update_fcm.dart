import 'Users.dart';

class update_fcm {
  Users? user;

  update_fcm({this.user});

  update_fcm.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new Users.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}