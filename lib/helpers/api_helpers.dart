import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modals/person_modal.dart';

class UserAPIHelper {
  UserAPIHelper._();

  static final UserAPIHelper userAPIHelper = UserAPIHelper._();

  Future<PersonData?> fetchingUserData() async {
    http.Response response =
    await http.get(Uri.parse("https://randomuser.me/api/"));

    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);
      PersonData  Data = PersonData.fromMap(e: decodedData);

      return Data;
    }
    return null;
  }
}