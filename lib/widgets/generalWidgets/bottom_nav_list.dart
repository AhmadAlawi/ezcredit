import 'package:ezcredit/screen/contact_us_screen.dart';
import 'package:ezcredit/screen/employement_screen.dart';
import 'package:ezcredit/screen/financial_screen.dart';
import 'package:ezcredit/screen/lenders_screen.dart';
import 'package:ezcredit/screen/notification_details.dart';
import 'package:ezcredit/screen/personal_info_screen.dart';
import 'package:ezcredit/screen/privacy_policy_screen.dart';
import 'package:ezcredit/screen/profile_help_screen.dart';
import 'package:ezcredit/screen/profile_screen.dart';
import 'package:ezcredit/screen/proposal_screen.dart';
import 'package:ezcredit/screen/residential_address_screen.dart';
import 'package:ezcredit/screen/settings_screen.dart';
import 'package:ezcredit/screen/term_condition_screen.dart';
import 'package:ezcredit/screen/testimonial_screen.dart';
import 'package:ezcredit/widgets/drawer/user_navigation.dart';
import 'package:ezcredit/widgets/proposalWidget/proposal_details.dart';
import 'package:ezcredit/widgets/proposalWidget/proposal_details_home.dart';
import 'package:flutter/material.dart';

import '../../screen/home_screen.dart';
import '../../screen/notification_screen.dart';
import '../../screen/offers_ecreen.dart';
import '../../screen/services_screen.dart';

int pageIndex = 2;
Widget? titleAppBar;

List<Widget> widgetOptions = [
  ServicesScreen(),
  OffersScreen(),
  HomeScreen(),
  NotificationScreen(),
  UserNavigation(),
  ProfileScreen(),
  PersonalInformationScreen(),
  ResidentialAddressScreen(),
  EmployementScreen(),
  FinancialScreen(),
  ProfileHelpScreen(),
  ProposalScreen(),
  TestimonialsScreen(),
  ContactUsScreen(),
  TermsAndConditionScreen(),
  PrivacyPolicyScreen(),
  SettingsScreen(),
  ProposalDetails(),
  LendersScreen(),
  ProposalHomeDetails(),
  NotificationDetails()
];
