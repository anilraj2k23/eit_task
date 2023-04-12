import 'package:eit_task/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:eit_task/models/models.dart';

Future<UserUpdateModel> updateUser({required String address, required String job,required String id}) async {
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  var request = http.Request('PUT', Uri.parse(ApiConstants.baseUrl+ApiConstants.updateEndpoint+id));
  request.bodyFields = {
    'address': address,
    'job': job
  };
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String responseString = await response.stream.bytesToString();
    return userUpdateModelFromJson(responseString);
  } else {
    throw Exception('Failed to update user.');
  }
}
