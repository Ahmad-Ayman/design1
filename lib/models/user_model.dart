class User {
  String? status;
  String? message;
  UserData? userData;

  User({this.status, this.message, this.userData});

  User.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userData = json['user_data'] != null ? new UserData.fromJson(json['user_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? userId;
  String? firstName;
  String? lastName;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userImage;
  List<Addresses>? addresses;

  UserData({this.userId, this.firstName, this.lastName, this.userName, this.userEmail, this.userPhone, this.userImage, this.addresses});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userImage = json['user_image'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    data['user_image'] = this.userImage;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  String? address;
  int? addressId;

  Addresses({this.address, this.addressId});

  Addresses.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    addressId = json['address_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['address_id'] = this.addressId;
    return data;
  }
}
