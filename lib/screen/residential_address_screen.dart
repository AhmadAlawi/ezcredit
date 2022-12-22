// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:ezcredit/widgets/profileWidgets/resdentials_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../controller/address_controller.dart';
import '../lang/key_lang.dart';
import '../theme/app_colors.dart';

class ResidentialAddressScreen extends StatefulWidget {
  static const String id = 'ResidentialAddressScreen';

  const ResidentialAddressScreen({Key? key}) : super(key: key);

  @override
  State<ResidentialAddressScreen> createState() =>
      _ResidentialAddressScreenState();
}

class _ResidentialAddressScreenState extends State<ResidentialAddressScreen> {
  @override
  void initState() {
    Provider.of<AddressController>(context, listen: false)
        .checkAddressData(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressController>(
        builder: (context, addressController, child) {
      if (addressController.isLoading == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                KeyLang.residentialAddress.tr().toUpperCase(),
                style: AppColors.fredoka.headline6,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const ResdentialWidget(),
          ],
        );
      }
    });
  }
}
