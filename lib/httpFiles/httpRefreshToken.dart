import 'package:http/http.dart' as http;

import '../json/RefreshTokenJSON.dart';

class RefreshTokenHttpRemote {
  Future<RefreshToken?> getRefreshTokenData(String auth) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $auth"
    };
    var uri = Uri.parse("https://cinecompass.yuktidea.com/api/v1/refresh");
    var client = await http.get(uri, headers: headers);
    print(client.body);
    return refreshTokenFromJson(client.body);
  }
}
