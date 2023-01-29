import 'package:assignment1/json/verifyOtp.dart';
import 'package:http/http.dart' as http;

class VerifyOtpHttpRemote {
  Future<VerifyOtp?> getVerifyOtpData(String otp, String auth) async {
    Map<String, String> body = {"otp": otp};
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $auth"
    };
    var uri = Uri.parse("https://cinecompass.yuktidea.com/api/v1/otp/verify");
    var client = await http.post(uri, body: body, headers: headers);
    print(client.body);
    return verifyOtpFromJson(client.body);
  }
}