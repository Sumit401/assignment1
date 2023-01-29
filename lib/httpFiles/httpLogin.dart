import 'package:http/http.dart' as http;

import '../json/LoginJSON.dart';

class LoginHttpRemote {
  Future<LoginJson?> getLoginData(String email, String password) async {
    Map<String, dynamic> body = {
      "login": email,
      "password": password,
    };
    var uri = Uri.parse("https://cinecompass.yuktidea.com/api/v1/login/");
    var client = await http.post(uri, body: body);
    var json = client.body;
    return loginJsonFromJson(json);
  }
}
