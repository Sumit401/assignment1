import '../json/RegisterJSON.dart';
import 'package:http/http.dart' as http;

class RegisterHttpRemote {

  Future<RegisterJson?> getRegisterData(String email, String name, String password, String cnfPassword, String phoneNo) async{
    Map<String, String> body = {
      "name" : name,
      "email" : email,
      "phone" : phoneNo,
      "password" : password,
      "password_confirmation" : cnfPassword
    };
    var uri = Uri.parse("https://cinecompass.yuktidea.com/api/v1/register");
    var client = await http.post(uri,body: body);
    print(client.body);
    return registerJsonFromJson(client.body);
  }
}