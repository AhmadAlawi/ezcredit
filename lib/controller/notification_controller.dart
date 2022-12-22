import 'dart:developer';

import 'package:ezcredit/api/generalApis/notification_api.dart';
import 'package:ezcredit/globals.dart';
import 'package:ezcredit/model/notification_model.dart';
import 'package:flutter/material.dart';

import '../model/notification_user_model.dart';

class NotificationController extends ChangeNotifier {
  List<NotificationModel>? notification = [];
  List<NotificationUser>? userNotification = [];

  bool isLoading = false;
  String errorMessage = '';

  int index = 0;

  void setNotificationIndex(int i) {
    index = i;
    notifyListeners();
  }

  Future<List<NotificationUser>?> getUserNotificationHandler(
      BuildContext context) async {
    try {
      isLoading = true;
      userNotification = await NotificationsAPI()
          .getUserNotificationEndPoints(userId, context);
      if (userNotification!.isNotEmpty) {
        isLoading = false;
      } else {
        isLoading = false;
        errorMessage = NotificationsAPI().errorMessage;
      }

      notifyListeners();
      return userNotification;
    } catch (e) {
      isLoading = false;

      errorMessage = NotificationsAPI().errorMessage;
    }
  }

  Future<List<NotificationModel>?> getNotificationHandler(
      BuildContext context) async {
    try {
      isLoading = true;
      notification = await NotificationsAPI().getNotificationEndPoints(context);
      if (notification!.isNotEmpty) {
        isLoading = false;
      } else {
        isLoading = false;
        errorMessage = NotificationsAPI().errorMessage;
      }
      notifyListeners();
      return notification;
    } catch (e) {
      isLoading = false;

      errorMessage = NotificationsAPI().errorMessage;
    }
  }

  void removeNotification() {
    notification = [];
    userNotification = [];
  }
}
