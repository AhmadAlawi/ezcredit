import 'package:ezcredit/model/offers_model.dart';

class NotificationUser {
  int? id;
  String? title;
  String? body;
  int? sentFor;
  String? type;
  String? createdAt;
  OffersModel? payload;

  NotificationUser(
      {this.id,
      this.title,
      this.body,
      this.sentFor,
      this.type,
      this.createdAt,
      this.payload});

  NotificationUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    sentFor = json['sent_for'];
    type = json['type'];
    createdAt = json['created_at'];
    payload =
        json['payload'] != null ? OffersModel.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['sent_for'] = sentFor;
    data['type'] = type;
    data['created_at'] = createdAt;
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    return data;
  }
}
