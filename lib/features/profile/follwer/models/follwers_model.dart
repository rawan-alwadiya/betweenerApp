class FollwerResponse {
  int? followingCount;
  int? followersCount;
  List<Following>? following;
  List<Followers>? followers;

  FollwerResponse(
      {this.followingCount,
      this.followersCount,
      this.following,
      this.followers});

  FollwerResponse.fromJson(Map<String, dynamic> json) {
    followingCount = json['following_count'];
    followersCount = json['followers_count'];
    if (json['following'] != null) {
      following = <Following>[];
      json['following'].forEach((v) {
        following!.add(new Following.fromJson(v));
      });
    }
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(new Followers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['following_count'] = this.followingCount;
    data['followers_count'] = this.followersCount;
    if (this.following != null) {
      data['following'] = this.following!.map((v) => v.toJson()).toList();
    }
    if (this.followers != null) {
      data['followers'] = this.followers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Following {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  Null? country;
  Null? ip;
  double? long;
  double? lat;
  String? fcm;

  Following(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.country,
      this.ip,
      this.long,
      this.lat,
      this.fcm});

  Following.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['isActive'];
    country = json['country'];
    ip = json['ip'];
    long = json['long'];
    lat = json['lat'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['isActive'] = this.isActive;
    data['country'] = this.country;
    data['ip'] = this.ip;
    data['long'] = this.long;
    data['lat'] = this.lat;
    data['fcm'] = this.fcm;
    return data;
  }
}

class Followers {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? isActive;
  Null? country;
  Null? ip;
  Null? long;
  Null? lat;
  Null? fcm;

  Followers(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.country,
      this.ip,
      this.long,
      this.lat,
      this.fcm});

  Followers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['isActive'];
    country = json['country'];
    ip = json['ip'];
    long = json['long'];
    lat = json['lat'];
    fcm = json['fcm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['isActive'] = this.isActive;
    data['country'] = this.country;
    data['ip'] = this.ip;
    data['long'] = this.long;
    data['lat'] = this.lat;
    data['fcm'] = this.fcm;
    return data;
  }
}
