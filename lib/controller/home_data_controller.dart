import 'package:ezcredit/api/generalApis/home_data_api.dart';
import 'package:ezcredit/api/generalApis/offers_api.dart';
import 'package:ezcredit/model/offers_model.dart';
import 'package:ezcredit/widgets/generalWidgets/common_ui.dart';
import 'package:flutter/material.dart';

import '../model/home_model.dart';

class HomeDataController extends ChangeNotifier {
  HomeDataModel? homeModel;

  List<OffersModel>? offersModel = [];
  Requests? requests;
  int index = 0;
  String? status;

  bool isLoading = false;
  String errorMessage = '';

  void setOfferIndex(int i) {
    index = i;
    notifyListeners();
  }

  Future getHomeDataHandler(BuildContext context) async {
    try {
      isLoading = true;
      homeModel = await HomeDataAPI().getHomeDataEndPoints(context);

      isLoading = false;
      notifyListeners();
      if (homeModel != null) {
        offersModel = homeModel?.data?.offers;
        print(offersModel);

        requests = homeModel?.data?.requests?[0];
      } else {
        errorMessage = OffersAPI().errorMessage;
        CommonUi.snackBar(context, errorMessage);
      }
    } catch (e) {
      isLoading = false;

      errorMessage = OffersAPI().errorMessage;

      notifyListeners();
    }
  }

  void removeData() {
    offersModel?.clear();
    requests = Requests();
  }
}
