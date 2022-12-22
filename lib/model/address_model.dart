class Addressmodel {
  String? address;
  String? streetName;
  String? buildingNumber;
  int? cityId;
  String? cityEn;
  String? cityAr;
  int? countryId;
  String? countryEn;
  String? countryAr;

  Addressmodel(
      {this.address,
      this.streetName,
      this.buildingNumber,
      this.cityId,
      this.cityEn,
      this.cityAr,
      this.countryId,
      this.countryEn,
      this.countryAr});

  Addressmodel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    streetName = json['street_name'];
    buildingNumber = json['building_number'];
    cityId = json['city_id'];
    cityEn = json['city_en'];
    cityAr = json['city_ar'];
    countryId = json['country_id'];
    countryEn = json['country_en'];
    countryAr = json['country_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['street_name'] = streetName;
    data['building_number'] = buildingNumber;
    data['city_id'] = cityId;
    data['city_en'] = cityEn;
    data['city_ar'] = cityAr;
    data['country_id'] = countryId;
    data['country_en'] = countryEn;
    data['country_ar'] = countryAr;
    return data;
  }
}
