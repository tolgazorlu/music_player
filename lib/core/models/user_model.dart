//User model

class UserModel {
  List<String>? userRoomsId;
  String? sId;
  String? userName;
  String? userSurname;
  String? userEmail;
  String? userPassword;

  UserModel(
      {this.userRoomsId,
      this.sId,
      this.userName,
      this.userSurname,
      this.userEmail,
      this.userPassword});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['user_name'];
    userSurname = json['user_surname'];
    userEmail = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['user_surname'] = this.userSurname;
    data['user_email'] = this.userEmail;
    data['user_password'] = this.userPassword;
    return data;
  }

  Map<String, dynamic> toLoginJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_email'] = this.userEmail;
    data['user_password'] = this.userPassword;
    return data;
  }
}
