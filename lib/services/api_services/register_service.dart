

import 'package:eit_task/models/models.dart';
import 'package:eit_task/utils/constants.dart';
import 'package:http/http.dart' as http;



  Future<UserRegisterModel> registerUser({required String email, required String password}) async {
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };

  var request = http.Request('POST', Uri.parse(ApiConstants.baseUrl+ApiConstants.registerEndpoint));

  request.bodyFields = {
    'email': email,
    'password': password
  };
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseString = await response.stream.bytesToString();
    print(response);
    return userRegisterModelFromJson(responseString);
  } else {
    throw Exception(response.reasonPhrase);
  }
}
