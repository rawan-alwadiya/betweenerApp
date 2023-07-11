class Users{
 late int id;
 late String name;
 late String email;
 late String password;
  // Null emailVerifiedAt;
  // String createdAt;
  // String updatedAt;
  // int isActive;
  // Null country;
  // Null ip;
  // double long;
  // double lat;
 DateTime? emailVerifiedAt;
  late DateTime createdAt;
  late DateTime updatedAt;
  late int isActive;
  String? country;
  String? ip;
  late double longitude;
  late double latitude;
  late String fcm;
  late String token;

  Users();

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['isActive'];
    country = json['country'];
    ip = json['ip'];
    longitude = json['long'];
    latitude = json['lat'];
    fcm = json['fcm'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['isActive'] = this.isActive;
    data['country'] = this.country;
    data['ip'] = this.ip;
    data['long'] = this.longitude;
    data['lat'] = this.latitude;
    data['fcm'] = this.fcm;
    data['token'] = this.token;
    return data;
  }
}

