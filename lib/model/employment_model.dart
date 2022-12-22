class EmploymentModel {
  String? employmentStatus;
  String? employer;
  String? currency;
  int? income;

  EmploymentModel(
      {this.employmentStatus, this.employer, this.currency, this.income});

  EmploymentModel.fromJson(Map<String, dynamic> json) {
    employmentStatus = json['employment_status'];
    employer = json['employer'];
    currency = json['currency'];
    income = json['income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['employment_status'] = employmentStatus;
    data['employer'] = employer;
    data['currency'] = currency;
    data['income'] = income;
    return data;
  }
}
