import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/const/baseurl.dart';

class TakeattendenceProvider extends GetConnect {
  Future<dynamic> getSubmit(
          {String? name,
          String? uid,
          String? latitude,
          String? longitude,
          String? requestId}) =>
      http
          .post(Uri.parse('${BaseUrl.baseUrl}/api/attendance'), body: {
            'name': name,
            'uid': uid,
            'latitude': latitude,
            'longitude': longitude,
            'request_id': requestId,
          })
          .then((value) => value)
          .onError((error, stackTrace) => Future.error(error.toString()));
}
