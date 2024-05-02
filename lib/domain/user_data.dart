import 'package:hello_world/data/user_data.dart';
import 'package:http/http.dart' as http;

class UserDataDomain {
  static Future<UserData?> getUserData() async {
    var url = Uri.parse('https://reqres.in/api/users?page=1');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      UserData userData = userDataFromJson(response.body);
      return userData;
    }
    return null;
  }
}
