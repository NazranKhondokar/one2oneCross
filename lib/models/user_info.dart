class UserInfo {
  String? status;
  String? userName;
  String? email;
  List<Roles>? roles;

  UserInfo({this.status, this.userName, this.email, this.roles});

  UserInfo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userName = json['userName'];
    email = json['email'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['userName'] = this.userName;
    data['email'] = this.email;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? name;
  String? statusName;

  Roles({this.id, this.name, this.statusName});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    statusName = json['statusName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['statusName'] = this.statusName;
    return data;
  }
}
