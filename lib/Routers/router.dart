import 'package:ezcredit/screen/apply_loan_screen.dart';
import 'package:ezcredit/screen/contact_us_screen.dart';
import 'package:ezcredit/screen/employement_screen.dart';
import 'package:ezcredit/screen/financial_screen.dart';
import 'package:ezcredit/screen/get_started_screen.dart';
import 'package:ezcredit/screen/guest_screen.dart';
import 'package:ezcredit/screen/home_screen.dart';
import 'package:ezcredit/screen/lenders_screen.dart';
import 'package:ezcredit/screen/login_screen.dart';
import 'package:ezcredit/screen/main_screen.dart';
import 'package:ezcredit/screen/main_screen_two.dart';
import 'package:ezcredit/screen/maintenance_screen.dart';
import 'package:ezcredit/screen/notification_screen.dart';
import 'package:ezcredit/screen/offers_ecreen.dart';
import 'package:ezcredit/screen/onboard_screen.dart';
import 'package:ezcredit/screen/otp_screen.dart';
import 'package:ezcredit/screen/personal_info_screen.dart';
import 'package:ezcredit/screen/privacy_policy_screen.dart';
import 'package:ezcredit/screen/profile_screen.dart';
import 'package:ezcredit/screen/proposal_screen.dart';
import 'package:ezcredit/screen/residential_address_screen.dart';
import 'package:ezcredit/screen/services_screen.dart';
import 'package:ezcredit/screen/settings_screen.dart';
import 'package:ezcredit/screen/sign_up_screen.dart';
import 'package:ezcredit/screen/term_condition_screen.dart';
import 'package:ezcredit/screen/testimonial_screen.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/credit_widget.dart';
import 'package:ezcredit/widgets/guestScreenWidgets/loan_widget.dart';
import 'package:ezcredit/widgets/settings/change_password.dart';
import 'package:ezcredit/widgets/settings/email_address.dart';
import 'package:ezcredit/widgets/settings/language.dart';
import 'package:flutter/material.dart';

import '../screen/forget_password_screen.dart';

class AppRoutes {
  Map<String, WidgetBuilder> routes = {
    GetStartedScreen.id: (context) => GetStartedScreen(),
    ApplyLoanScreen.id: (context) => ApplyLoanScreen(),
    ContactUsScreen.id: (context) => ContactUsScreen(),
    EmployementScreen.id: (context) => EmployementScreen(),
    FinancialScreen.id: (context) => FinancialScreen(),
    GuestScreen.id: (context) => GuestScreen(),
    HomeScreen.id: (context) => HomeScreen(),
    LoginScreen.id: (context) => LoginScreen(),
    MaintenenceScreen.id: (context) => MaintenenceScreen(),
    NotificationScreen.id: (context) => NotificationScreen(),
    OffersScreen.id: (context) => OffersScreen(),
    OnBoarding.id: (context) => OnBoarding(),
    OtpScreen.id: (context) => OtpScreen(),
    PersonalInformationScreen.id: (context) => PersonalInformationScreen(),
    PrivacyPolicyScreen.id: (context) => PrivacyPolicyScreen(),
    ProfileScreen.id: (context) => ProfileScreen(),
    ProposalScreen.id: (context) => ProposalScreen(),
    ResidentialAddressScreen.id: (context) => ResidentialAddressScreen(),
    ServicesScreen.id: (context) => ServicesScreen(),
    SignUpScreen.id: (context) => SignUpScreen(),
    TermsAndConditionScreen.id: (context) => TermsAndConditionScreen(),
    MainScreenTwo.id: (context) => MainScreenTwo(),
    TestimonialsScreen.id: (context) => TestimonialsScreen(),
    LendersScreen.id: (context) => LendersScreen(),
    ForgetPasswordScreens.id: (context) => ForgetPasswordScreens(),
    CreditServicesWidget.id: (context) => CreditServicesWidget(),
    EmailWidget.id: (context) => EmailWidget(),
    ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
    LanguageWidget.id: (context) => LanguageWidget(),
    SettingsScreen.id: (context) => SettingsScreen(),
    MainScreen.id: (context) => MainScreen(),
    LoanServicesWidget.id: (context) => LoanServicesWidget()
  };
}
