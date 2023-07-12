class R_User {
  late String name;
  late String email;
  late String updatedAt;
  late String createdAt;
  late int id;
  double? lat;
  double? long;
  String? fcm;

  R_User( this.name,   this.email, this.updatedAt, this.createdAt, this.id,{this.lat,this.long,this.fcm});

  R_User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    lat = json['lat'];
    long = json['long'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['fcm'] = this.fcm;
    return data;
  }
}