import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_scrapper/home/screen/modal/home_modal.dart';

class ApiHttp {
  Future<IntroModal> getApi() async {
    String link = "https://randomuser.me/api/";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    IntroModal homeModel = IntroModal.fromJson(json);
    return homeModel;
  }

// Future<HomeModel?> getApi() async {
//   var response = await http.get(Uri.parse(link));
//
//   if (response.statusCode == 200) {
//     dynamic json = jsonDecode(response.body);
//     HomeModel  d1 = HomeModel.fromJson(json);
//     print("=================================");
//     return d1;
//   } else {
//     return null;
//   }
// }
}
