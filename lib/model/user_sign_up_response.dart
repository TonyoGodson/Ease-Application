class UserSignUpResponse {
  String? message;
  UserInfo? userInfo;

  UserSignUpResponse({this.message, this.userInfo});

  UserSignUpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
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
