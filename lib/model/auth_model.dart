class UserModel {
  bool? success;
  String? message;
  Data? data;

  UserModel({this.success, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  bool? mpinSet;
  User? user;

  Data({this.token, this.mpinSet, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    mpinSet = json['mpin_set'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['mpin_set'] = this.mpinSet;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? phone;
 var name;
  String? kycStatus;
  bool? mpin_set;

  User({this.id, this.phone, this.name, this.kycStatus,this.mpin_set});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    kycStatus = json['kyc_status'];
    mpin_set = json['mpin_set'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['kyc_status'] = this.kycStatus;
    data['mpin_set'] = this.mpin_set;
    return data;
  }
}
