class TestimonialsModel {
  int? id;
  String? name;
  String? body;
  String? createdAt;

  TestimonialsModel({this.id, this.name, this.body, this.createdAt});

  TestimonialsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    body = json['body'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['body'] = body;
    data['created_at'] = createdAt;
    return data;
  }
}
