class ResetPasswordResponse {
  String? message;
  bool? success;
  String? token;

  ResetPasswordResponse({this.message, this.success, this.token});

  ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['token'] = this.token;
    return data;
  }
}
