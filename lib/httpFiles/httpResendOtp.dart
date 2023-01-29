import 'package:http/http.dart' as http;

import '../json/ResendOtp.dart';

class ResendOtpHttpRemote {
  Future<ResendOtp?> getResendOtpData(String auth) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $auth"
    };
    var uri = Uri.parse("https://cinecompass.yuktidea.com/api/v1/otp/resend");
    var client = await http.post(uri, headers: headers);
    print(client.body);
    return resendOtpFromJson(client.body);
  }
}
