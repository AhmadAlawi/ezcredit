class EndPoints {
  static const server = 'http://192.168.1.20:8081/api/';

  // ****************************** AUTH END POINTS ******************************

  static const config = 'sys/config';
  static const signup = 'auth/signup';
  static const login = 'auth/login';
  static const checkOtp = 'auth/check_otp';
  static const forgetpass = 'auth/forget_pass';
  static const changepass = 'user/pc_c';

  // ****************************** GENERAL END POINTS ******************************

  static const testimonials = 'admin/get_testimonials';
  static const getCountries = 'sys/countries';
  static const getCities = "sys/cities";
  static const getLenders = "admin/get_lenders";

  // ****************************** NOTIFICATION END POINTS ******************************

  static const notification = 'sys/all_notifications';
  static const userNotification = 'user/user_notifications';

  // ****************************** PROFILE END POINTS ******************************

  static const getProfileInfo = 'user/get_profile_info';
  static const getEmployeeInfo = 'user/get_emp_info';
  static const getAddressInfo = 'user/get_res_info';
  static const getFinancialInfo = 'user/get_financial_info';

  static const addProfileInfo = 'user/add_profile_info';

  static const updateProfileInfo = 'user/update_profile_info';
  static const updateEmployeeInfo = 'user/edit_emp_info';
  static const updateAddressInfo = 'user/edit_res_info';
  static const updateFinancialInfo = 'user/edit_financial_info';

  // ****************************** Offers END POINTS ******************************

  static const getOffers = 'user/get_offers';

  // ****************************** APPLY LOAN END POINTS ******************************

  static const applyLoan = 'user/apply_loan';
  static const loanValidate = 'user/loan_validation';

  // ****************************** HOME END POINTS ******************************

  static const homeDataApi = 'user/home_screen';

  // ****************************** APPLY CAR LEASING END POINTS ******************************

  static const applycarlease = 'user/apply_cleasing';
}
