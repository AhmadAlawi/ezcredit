class OffersModel {
  int? id;
  String? createdAt;
  String? offeredLoanType;
  int? offeredAmount;
  String? offeredInstallments;
  int? offeredInterestRate;
  String? offerStatus;
  String? note;
  int? bankId;
  int? requestId;
  String? requestedLoanType;
  int? requestedAmount;
  int? requestedInstallmentsNumber;
  String? banknameEn;
  String? banknameAr;
  String? logoUrl;

  OffersModel(
      {this.id,
      this.createdAt,
      this.offeredLoanType,
      this.offeredAmount,
      this.offeredInstallments,
      this.offeredInterestRate,
      this.offerStatus,
      this.note,
      this.bankId,
      this.requestId,
      this.requestedLoanType,
      this.requestedAmount,
      this.requestedInstallmentsNumber,
      this.banknameEn,
      this.banknameAr,
      this.logoUrl});

  OffersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    offeredLoanType = json['offered_loan_type'];
    offeredAmount = json['offered_amount'];
    offeredInstallments = json['offered_installments'];
    offeredInterestRate = json['offered_interest_rate'];
    offerStatus = json['offer_status'];
    note = json['note'];
    bankId = json['bank_id'];
    requestId = json['request_id'];
    requestedLoanType = json['requested_loan_type'];
    requestedAmount = json['requested_amount'];
    requestedInstallmentsNumber = json['requested_installments_number'];
    banknameEn = json['bankname_en'];
    banknameAr = json['bankname_ar'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['offered_loan_type'] = offeredLoanType;
    data['offered_amount'] = offeredAmount;
    data['offered_installments'] = offeredInstallments;
    data['offered_interest_rate'] = offeredInterestRate;
    data['offer_status'] = offerStatus;
    data['note'] = note;
    data['bank_id'] = bankId;
    data['request_id'] = requestId;
    data['requested_loan_type'] = requestedLoanType;
    data['requested_amount'] = requestedAmount;
    data['requested_installments_number'] = requestedInstallmentsNumber;
    data['bankname_en'] = banknameEn;
    data['bankname_ar'] = banknameAr;
    data['logo_url'] = logoUrl;
    return data;
  }
}
