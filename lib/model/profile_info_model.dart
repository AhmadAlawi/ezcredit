class ProfileInfoModel {
  String? fullnameEn;
  String? fullnameAr;
  String? gender;
  int? nationality;
  String? birthDate;
  String? countryEn;
  String? countryAr;
  String? phone;
  String? cityEn;
  String? cityAr;
  int? cityId;
  String? civilId;

  ProfileInfoModel(
      {this.fullnameEn,
      this.fullnameAr,
      this.gender,
      this.nationality,
      this.birthDate,
      this.countryEn,
      this.countryAr,
      this.civilId,
      this.phone});

  ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    fullnameEn = json['fullname_en'];
    fullnameAr = json['fullname_ar'];
    gender = json['gender'];
    nationality = json['nationality'];
    birthDate = json['birth_date'];
    cityAr = json['city_ar'];
    cityEn = json['city_en'];
    cityId = json['city_id'];
    countryEn = json['country_en'];
    countryAr = json['country_ar'];
    civilId = json['civil_id'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname_en'] = fullnameEn;
    data['fullname_ar'] = fullnameAr;
    data['gender'] = gender;
    data['nationality'] = nationality;
    data['birth_date'] = birthDate;
    data['city_id'] = cityId;
    data['city_en'] = cityEn;
    data['city_ar'] = cityAr;
    data['country_en'] = countryEn;
    data['country_ar'] = countryAr;
    data['civil_id'] = civilId;
    data['phone'] = phone;
    return data;
  }
}
