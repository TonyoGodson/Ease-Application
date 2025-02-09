class UserLoginResponse {
  bool? success;
  String? token;
  UserInfo? userInfo;

  UserLoginResponse({this.success, this.token, this.userInfo});

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['token'] = this.token;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  String? fullName;
  String? email;
  String? phoneNumber;

  UserInfo({this.fullName, this.email, this.phoneNumber});

  UserInfo.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    final Map<String, dynamic> data = {};
    // data['fullName'] = this.fullName;
    data['fullName'] = fullName;
    // data['email'] = this.email;
    data['email'] = email;
    // data['phoneNumber'] = this.phoneNumber;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
