// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:ezcredit/model/notification_model.dart';
import 'package:ezcredit/model/notification_user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../controller/auth_controller.dart';
import '../../globals.dart';
import '../end_points.dart';

class NotificationsAPI {
  static final NotificationsAPI _appManager = NotificationsAPI._internal();

  factory NotificationsAPI() {
    return _appManager;
  }

  NotificationsAPI._internal();

  bool isLoading = false;
  dynamic errorMessage;

  // ************************************* GET ALL NOTIIFICATION API *************************************

  Future<List<NotificationModel>> getNotificationEndPoints(
      BuildContext context) async {
    late List<NotificationModel> notificationModel = [];

    try {
      isLoading = true;
      var url = Uri.parse('${EndPoints.server}${EndPoints.notification}');
      http.Response res = await http.get(
        url,
        headers: {'auth': authToken, "Content-Type": "application/json"},
      );
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var notification = json['data'];

        for (int i = 0; i <= notification.length; i++) {
          notificationModel.add(NotificationModel.fromJson(notification[i]));
        }
        isLoading = false;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors']['server']['msg_en'];
        }
      }
    } on SocketException {
      isLoading = false;
      errorMessage = 'No internet, Please connect to internet';
    } catch (e) {
      errorMessage = "error in get notification = $e";
      isLoading = false;
    }
    return notificationModel;
  }

  // ************************************* GET USER NOTIFICATION API *************************************

  Future<List<NotificationUser>> getUserNotificationEndPoints(
      userid, BuildContext context) async {
    late List<NotificationUser> notificationUserModel = [];

    try {
      isLoading = true;
      var url = Uri.parse(
          '${EndPoints.server}${EndPoints.userNotification}?userid=$userid');
      http.Response res = await http.get(
        url,
        headers: {'auth': authToken, "Content-Type": "application/json"},
      );
      var json = jsonDecode(res.body);

      if (res.statusCode == 200) {
        var notification = json['data'];

        for (int i = 0; i <= notification.length; i++) {
          notificationUserModel.add(NotificationUser.fromJson(notification[i]));
        }

        isLoading = false;
      } else {
        if (json['meta']['https_code'] == 401) {
          errorMessage = json['errors'];
          Authcontroller().logOut(context, errorMessage['server']['msg_en']);
        } else {
          errorMessage = json['errors']['server']['msg_en'];
        }
      }
    } on SocketException {
      isLoading = false;
      errorMessage = 'No internet, Please connect to internet';
    } catch (e) {
      errorMessage = "error in get user notification = $e";
      isLoading = false;
    }
    return notificationUserModel;
  }
}
