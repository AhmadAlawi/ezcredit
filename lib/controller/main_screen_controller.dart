import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/lang/key_lang.dart';
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
import 'package:ezcredit/widgets/generalWidgets/app_bar.dart';
import 'package:ezcredit/widgets/generalWidgets/default_appbar.dart';
import 'package:ezcredit/widgets/proposalWidget/proposal_details.dart';
import 'package:ezcredit/widgets/proposalWidget/proposal_details_home.dart';
import 'package:flutter/material.dart';
import '../screen/home_screen.dart';
import '../screen/notification_screen.dart';
import '../screen/offers_ecreen.dart';
import '../screen/services_screen.dart';
import '../widgets/generalWidgets/common_ui.dart';

class MainScreenController extends ChangeNotifier {
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

  changeBodyHandler(int index, {int offerIndex = 0}) {
    pageIndex = index;

    if (pageIndex == 2) {
      titleAppBar = DefaultAppBar();
      widgetOptions[0];

      notifyListeners();
    } else if (pageIndex == 6 ||
        pageIndex == 7 ||
        pageIndex == 8 ||
        pageIndex == 9) {
      titleAppBar = SecondAppBar(
        title: KeyLang.myProfile.tr(),
      );
      notifyListeners();
    } else if (pageIndex == 17 || pageIndex == 19) {
      titleAppBar = SecondAppBar(
        title: KeyLang.proposal.tr(),
      );
      notifyListeners();
    } else if (pageIndex == 0 ||
        pageIndex == 1 ||
        pageIndex == 3 ||
        pageIndex == 4) {
      titleAppBar = SecondAppBar();
      notifyListeners();
    } else {
      titleAppBar = SecondAppBar(
        title: KeyLang.more.tr(),
      );
      notifyListeners();
    }
  }

  Future<bool> onWillPop() async {
    DateTime? backButtonPressedTime;

    DateTime currentTime = DateTime.now();
    bool backButton = backButtonPressedTime == null ||
        currentTime.difference(backButtonPressedTime) > Duration(seconds: 3);
    if (backButton) {
      if (pageIndex == 6 ||
          pageIndex == 7 ||
          pageIndex == 8 ||
          pageIndex == 9) {
        pageIndex = 5;
        notifyListeners();
      } else if (pageIndex == 17 || pageIndex == 19) {
        pageIndex = 11;
        notifyListeners();
      } else if (pageIndex == 2) {
        backButtonPressedTime = currentTime;
        CommonUi.simpleToast(message: 'Double click to exit');
        notifyListeners();
      } else if (pageIndex == 0 ||
          pageIndex == 1 ||
          pageIndex == 3 ||
          pageIndex == 4) {
        changeBodyHandler(2);
        pageIndex = 2;
        notifyListeners();
      } else {
        pageIndex = 4;
        notifyListeners();
      }
      return false;
    }
    notifyListeners();
    return true;
  }
}
