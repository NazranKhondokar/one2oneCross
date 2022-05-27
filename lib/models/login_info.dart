class LoginInfo {
  String? mobileOrEmail;
  String? password;

  LoginInfo({this.mobileOrEmail, this.password});

  LoginInfo.fromJson(Map<String, dynamic> json) {
    mobileOrEmail = json['mobileOrEmail'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileOrEmail'] = this.mobileOrEmail;
    data['password'] = this.password;
    return data;
  }
}