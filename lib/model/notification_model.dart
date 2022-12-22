class NotificationModel {
  int? id;
  String? title;
  String? body;
  int? sentFor;
  String? type;
  String? createdAt;

  NotificationModel(
      {this.id,
      this.title,
      this.body,
      this.sentFor,
      this.type,
      this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    sentFor = json['sent_for'];
    type = json['type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['sent_for'] = sentFor;
    data['type'] = type;
    data['created_at'] = createdAt;
    return data;
  }
}
