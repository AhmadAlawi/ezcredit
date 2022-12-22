// import 'package:app_settings/app_settings.dart';
import 'package:ezcredit/widgets/generalWidgets/dialogs.dart';
import 'package:ezcredit/widgets/generalWidgets/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin CommonUi {
  static bool checkInternetShown = false;

  /// THIS METHOD USED TO CHECK IF THE INTERNET IS WORKING OR NOT, AND IF NOT THE PHONE SETTING WILL OPEN
  static Future<void> checkInternet(BuildContext context) async {
    if (!checkInternetShown) {
      checkInternetShown = true;
      messageDialog(
        context,
        title: "noInternet",
        msg: "check ypur interner",
        onDismiss: () {
          checkInternetShown = false;
        },
        onConfirm: () {
          // AppSettings.openWIFISettings();
        },
      );
    }
  }

  /// THIS METHOD USED TO SHOW DIALOGS BASED ON OS PLATFORM
  static Future<void> messageDialog(
    BuildContext context, {
    String title = '',
    String msg = '',
    Function? onConfirm,
    Function? onDismiss,
  }) async {
    await Dialogs.showOSDialog(
      context: context,
      title: title,
      message: msg,
      firstButtonText: "Yes",
      firstCallBack: () {
        postDelayed(
          callbak: () {
            onConfirm?.call();
          },
        );
      },
      secondButtonText: "No",
    );
    if (onDismiss != null) {
      onDismiss();
    }
  }

  static simpleToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static snackBar(
    BuildContext context,
    String msg, {
    Color bgColor = Colors.black,
    Color textColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(color: textColor, fontSize: kIsWeb ? 18 : null),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        backgroundColor: bgColor,
        duration: const Duration(milliseconds: 3000),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      ),
    );
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
