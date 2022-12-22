import 'dart:convert';

class CitiesModel {
  int? id;
  int? country;
  String? nameEn;
  String? nameAr;

  CitiesModel({this.id, this.country, this.nameEn, this.nameAr});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['country'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country'] = country;
    data['name_en'] = nameEn;
    data['name_ar'] = nameAr;
    return data;
  }

  static Map<String, dynamic> toMap(CitiesModel city) => {
        'id': city.id,
        'country': city.country,
        'name_en': city.nameEn,
        'name_ar': city.nameAr,
      };

  static String encode(List<CitiesModel> city) => json.encode(
        city
            .map<Map<String, dynamic>>((cities) => CitiesModel.toMap(cities))
            .toList(),
      );

  static List<CitiesModel> decode(String city) =>
      (json.decode(city) as List<dynamic>)
          .map<CitiesModel>((item) => CitiesModel.fromJson(item))
          .toList();
}
