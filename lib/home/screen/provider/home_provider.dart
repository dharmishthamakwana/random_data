import 'package:flutter/widgets.dart';
import 'package:sky_scrapper/home/screen/modal/home_modal.dart';
import 'package:sky_scrapper/home/utiles/ApiHelpers.dart';

class IntroProvider extends ChangeNotifier {
  IntroModal? homeModeldata;
  IntroModal? data;

  Future<IntroModal?> getNews() async {
    ApiHttp apiHttp = ApiHttp();
    IntroModal? newsModal = await apiHttp.getApi();
    homeModeldata = newsModal;
    return newsModal;
  }

  void Refresh(Data) {
    data = Data;
    notifyListeners();
  }
}
