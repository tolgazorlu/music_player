import 'dart:convert';

import 'package:musicapps/core/api_services/base_service.dart';
import 'package:musicapps/core/models/user_model.dart';

import 'package:http/http.dart' as http;

class AuthenticationService extends BaseService {
  Future register({required UserModel userModel}) async {
    try {
      http.Response response = await http.post(Uri.parse('${BASE_URL}user'),
          body: userModel.toJson());

      print(response.statusCode.toString());
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future login({required String email, required String password}) async {
    try {
      UserModel model = UserModel(userEmail: email, userPassword: password);
      var status_code = 0;
      http.Response response = await http
          .post(Uri.parse('${BASE_URL}user/login'), body: model.toLoginJson());
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 400) {
        status_code = response.statusCode;
        return status_code;
      } else if (response.statusCode == 401) {
        status_code = response.statusCode;
        return status_code;
      } else {
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}
