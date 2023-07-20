class SetActiveSharing {
  late ActiveSharing activeSharing;

  // SetActiveSharing({this.activeSharing});

  SetActiveSharing.fromJson(Map<String, dynamic> json) {
    activeSharing = json['activeSharing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activeSharing != null) {
      data['activeSharing'] = this.activeSharing!.toJson();
    }
    return data;
  }
}

class ActiveSharing {
  late int userId;
  late String type;
  late String updatedAt;
  late String createdAt;
  late int id;

  // ActiveSharing(
  //     {this.userId, this.type, this.updatedAt, this.createdAt, this.id});

  ActiveSharing.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}