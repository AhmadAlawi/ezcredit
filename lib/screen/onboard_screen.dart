import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/lang/key_lang.dart';
import 'package:ezcredit/screen/get_started_screen.dart';
import 'package:ezcredit/style/assets.dart';
import 'package:ezcredit/theme/app_colors.dart';
import 'package:ezcredit/widgets/generalWidgets/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  static const String id = 'OnBoardingScreen';

  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

const int _numPages = 3;
PageController _pageController = PageController(initialPage: 0);
int _currentPage = 0;

List<Widget> _buildPageIndirector() {
  List<Widget> list = [];
  for (int i = 0; i <= _numPages; i++) {
    list.add(i == _currentPage ? _indicator(true) : _indicator(false));
  }
  return list;
}

Widget _indicator(bool isActive) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 3),
    height: 5.h,
    width: 30.w,
    decoration: BoxDecoration(
        color: isActive ? AppColors.white : const Color(0xff114584),
        borderRadius: BorderRadius.circular(12)),
  );
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 380.h,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    OnBoardingWidget(
                        icon: SvgAssets.ezCredit,
                        title: KeyLang.ezcredit.tr(),
                        description: KeyLang.bankingServices.tr()),
                    OnBoardingWidget(
                        icon: SvgAssets.needLoan,
                        title: KeyLang.needLoan.tr(),
                        description: KeyLang.hederSliderLoanDesc.tr()),
                    OnBoardingWidget(
                        icon: SvgAssets.creditCardSlider,
                        title: KeyLang.hederSliderCredit.tr(),
                        description: KeyLang.hederSliderCreditDesc.tr()),
                    OnBoardingWidget(
                        icon: SvgAssets.deposit,
                        title: KeyLang.hederSliderBest.tr(),
                        description: KeyLang.hederSliderBestDesc.tr()),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndirector(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('firsttime', false).then((value) =>
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const GetStartedScreen()),
                            (route) => false));
                  },
                  child: Text(
                    KeyLang.skip.tr(),
                    style: AppColors.fredoka.headline6!
                        .copyWith(color: AppColors.primary),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (_currentPage == 3) {
                      prefs.setBool('firsttime', false).then((value) =>
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const GetStartedScreen()),
                              (route) => false));
                    } else {
                      prefs
                          .setBool('firsttime', true)
                          .then((value) => _pageController.nextPage(
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.bounceIn,
                              ));
                    }
                  },
                  child: Text(
                    KeyLang.next.tr(),
                    style: AppColors.fredoka.headline6!.copyWith(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
