import 'package:ezcredit/api/generalApis/offers_api.dart';
import 'package:ezcredit/model/offers_model.dart';
import 'package:ezcredit/widgets/generalWidgets/common_ui.dart';
import 'package:flutter/material.dart';

class OffersController extends ChangeNotifier {
  List<OffersModel>? offers = [];
  int index = 0;
  String? status;

  bool isLoading = false;
  String errorMessage = '';

  void setOfferIndex(int i) {
    index = i;
    notifyListeners();
  }

  Future<List<OffersModel>?> getOffersHandler(BuildContext context) async {
    try {
      isLoading = true;
      offers = await OffersAPI().getOffersEndPoints(context);

      isLoading = false;
      notifyListeners();
      if (offers != null) {
        print('Done');
      } else {
        errorMessage = OffersAPI().errorMessage;
        CommonUi.snackBar(context, errorMessage);
      }
      notifyListeners();
    } catch (e) {
      errorMessage = OffersAPI().errorMessage;
      notifyListeners();
    }
  }
}
