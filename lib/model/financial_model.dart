class FinancialModel {
  int? totalLiabilities;
  int? loan;
  int? otherLiabilities;
  int? creditCard;
  int? totalMonthlyInstallments;

  FinancialModel(
      {this.totalLiabilities,
      this.loan,
      this.otherLiabilities,
      this.creditCard,
      this.totalMonthlyInstallments});

  FinancialModel.fromJson(Map<String, dynamic> json) {
    totalLiabilities = json['total_liabilities'];
    loan = json['loan'];
    otherLiabilities = json['other_liabilities'];
    creditCard = json['credit_card'];
    totalMonthlyInstallments = json['total_monthly_installments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_liabilities'] = totalLiabilities;
    data['loan'] = loan;
    data['other_liabilities'] = otherLiabilities;
    data['credit_card'] = creditCard;
    data['total_monthly_installments'] = totalMonthlyInstallments;
    return data;
  }
}
