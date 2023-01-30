import 'package:http/http.dart' as http;

import '../json/DeleteUserJson.dart';

class DeleteUserHttpRemote {
  Future<DeleteUser?> deleteUserData(String auth) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $auth"
    };
    var uri = Uri.parse("https://cinecompass.yuktidea.com/api/v1/user/delete");
    var client = await http.delete(uri, headers: headers);
    print(client.body);
    return deleteUserFromJson(client.body);
  }
}
