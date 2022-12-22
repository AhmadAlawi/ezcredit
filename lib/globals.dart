library global;

int? userId = 0;
String authToken = '';
String birthDate = '0000-00-00';
int? countryId;
int nationalityID = 0;
int cityId = 0;

int? selectedServicesIndex = 0;

List<String>? countriesStrings;
List<String>? citiesStrings;

bool apply = false;

String? userCountryEN;
String? userCountryAR;

String? userCityEN;
String? userCityAR;

bool? profile;

String? user;
bool termsSignup = false;

String? loanTitle;

Map<String, String>? header = {"Content-Type": "application/json"};
