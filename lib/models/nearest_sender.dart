import 'package:bootcamp_starter/models/Users.dart';
import 'package:bootcamp_starter/models/search_model.dart';

class NearestSender {
  int? count;
  List<Users>? nearestUsers;

  // NearestSender({this.count, this.nearestUsers});

  NearestSender.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['nearest-users'] != null) {
      nearestUsers = <Users>[];
      json['nearest-users'].forEach((v) {
        nearestUsers!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.nearestUsers != null) {
      data['nearest-users'] =
          this.nearestUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}