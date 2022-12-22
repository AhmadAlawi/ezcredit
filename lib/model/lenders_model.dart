class LendersModel {
  int? id;
  int? userId;
  String? banknameEn;
  String? banknameAr;
  String? address;
  String? contactNumber;
  String? contactEmail;
  String? bankType;
  String? logoUrl;

  LendersModel(
      {this.id,
      this.userId,
      this.banknameEn,
      this.banknameAr,
      this.address,
      this.contactNumber,
      this.contactEmail,
      this.bankType,
      this.logoUrl});

  LendersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    banknameEn = json['bankname_en'];
    banknameAr = json['bankname_ar'];
    address = json['address'];
    contactNumber = json['contact_number'];
    contactEmail = json['contact_email'];
    bankType = json['bank_type'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['bankname_en'] = banknameEn;
    data['bankname_ar'] = banknameAr;
    data['address'] = address;
    data['contact_number'] = contactNumber;
    data['contact_email'] = contactEmail;
    data['bank_type'] = bankType;
    data['logo_url'] = logoUrl;
    return data;
  }
}
