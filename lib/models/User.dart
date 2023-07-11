class User {
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
  late String fcm;

  // User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    // emailVerifiedAt = json['email_verified_at'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // isActive = json['isActive'];
    // country = json['country'];
    // ip = json['ip'];
    // long = json['long'];
    // lat = json['lat'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    // data['email_verified_at'] = this.emailVerifiedAt;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['isActive'] = this.isActive;
    // data['country'] = this.country;
    // data['ip'] = this.ip;
    // data['long'] = this.long;
    // data['lat'] = this.lat;
    data['fcm'] = this.fcm;
    return data;
  }
}