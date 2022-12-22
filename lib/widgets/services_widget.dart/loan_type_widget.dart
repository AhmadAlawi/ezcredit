import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../lang/key_lang.dart';
import '../../screen/loan_details_screen.dart';
import '../../style/assets.dart';
import '../../theme/app_colors.dart';
import '../generalWidgets/menu.dart';

class LoanTypeWidget extends StatelessWidget {
  const LoanTypeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardMenu(
          title: KeyLang.autoLoan.tr(),
          icon: SvgAssets.car,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoanDetailsScreen(
                          title: KeyLang.autoLoan.tr(),
                        )));
          },
        ),
        Divider(
          color: AppColors.dividerColor,
        ),
        CardMenu(
          title: KeyLang.housingLoan.tr(),
          icon: SvgAssets.homeDrawer,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoanDetailsScreen(
                          title: KeyLang.housingLoan.tr(),
                        )));
          },
        ),
        Divider(
          color: AppColors.dividerColor,
        ),
        CardMenu(
          title: KeyLang.personalLoan.tr(),
          icon: SvgAssets.person,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoanDetailsScreen(
                          title: KeyLang.personalLoan.tr(),
                        )));
          },
        ),
        Divider(
          color: AppColors.dividerColor,
        ),
      ],
    );
  }
}
