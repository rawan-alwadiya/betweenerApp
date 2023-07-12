import 'package:bootcamp_starter/models/link.dart';
class LinkResponse {
  int? totalResults;
  List<Link> results = [];

  LinkResponse.fromJson(Map<String, dynamic> json) {
    //you can use your custom json field depend on api response
    // totalResults = json['total_results'];
    if (json['links'] != null) {
      json['links'].forEach((v) {
        results.add(Link.fromJson(v));
      });
    }
  }
}

