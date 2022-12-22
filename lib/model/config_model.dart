class ConfigModel {
  bool? maintenance;
  String? currentAppBuild;
  bool? optionalUpdate;

  ConfigModel({this.maintenance, this.currentAppBuild, this.optionalUpdate});

  ConfigModel.fromJson(Map<String, dynamic> json) {
    maintenance = json['maintenance'];
    currentAppBuild = json['current_app_build'];
    optionalUpdate = json['optional_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maintenance'] = maintenance;
    data['current_app_build'] = currentAppBuild;
    data['optional_update'] = optionalUpdate;
    return data;
  }
}
