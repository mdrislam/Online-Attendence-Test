import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/const/baseurl.dart';

class HomeProvider extends GetConnect {
  Future<dynamic> getStoreList() => http
      .get(
        Uri.parse('${BaseUrl.baseUrl}/api/stores'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      )
      .then((value) => value)
      .onError((error, stackTrace) => Future.error(error.toString()));
}
