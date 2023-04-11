import 'package:eit_task/models/models.dart';
import 'package:eit_task/utils/constants.dart';
import 'package:http/http.dart' as http;

Future<UserModel> getUserDetails(  {required String id}) async {
  var request =
      http.Request('GET', Uri.parse(ApiConstants.baseUrl+ApiConstants.usersEndpoint+id));
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseString = await response.stream.bytesToString();
    return userModelFromJson(responseString);
  } else {
    throw Exception('Failed to get user details.');
  }
}
