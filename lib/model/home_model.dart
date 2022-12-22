import 'package:ezcredit/model/offers_model.dart';

class HomeDataModel {
  Data? data;

  HomeDataModel({this.data});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<OffersModel>? offers;
  List<Requests>? requests;

  Data({this.offers, this.requests});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['offers'] != null) {
      offers = <OffersModel>[];
      json['offers'].forEach((v) {
        offers!.add(OffersModel.fromJson(v));
      });
    }
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    if (requests != null) {
      data['requests'] = requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requests {
  int? id;
  String? type;
  String? createdAt;
  int? amount;
  String? expiryDate;

  Requests({this.id, this.type, this.createdAt, this.amount, this.expiryDate});

  Requests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    createdAt = json['created_at'];
    amount = json['amount'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['created_at'] = createdAt;
    data['amount'] = amount;
    data['expiry_date'] = expiryDate;
    return data;
  }
}
