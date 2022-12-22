import 'package:ezcredit/api/generalApis/general_api.dart';
import 'package:ezcredit/api/generalApis/lendres_api.dart';
import 'package:ezcredit/model/lenders_model.dart';
import 'package:flutter/material.dart';

class LendersController extends ChangeNotifier {
  List<LendersModel>? lendersModel = [];

  bool isLoading = false;
  String errorMessage = '';

  Future<List<LendersModel>?> getLendersHandler(BuildContext context) async {
    try {
      isLoading = true;
      lendersModel = await LendersAPI().getLendersEndPoints(context);
      if (lendersModel!.isNotEmpty) {
        isLoading = false;
      } else {
        isLoading = false;
        errorMessage = GeneralssAPI().errorMessage;
      }
      notifyListeners();
      return lendersModel;
    } catch (e) {
      errorMessage = GeneralssAPI().errorMessage;
    }
    return null;
  }
}
