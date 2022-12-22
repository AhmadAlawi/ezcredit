import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/form_style.dart';
import '../../theme/app_colors.dart';

class ProfileTextField extends StatelessWidget {
  final String title;
  final String hint;
  final Color? filledColor;
  final bool? readOnly;
  final TextEditingController? fieldController;
  final String? Function(String?)? fieldValidator;
  const ProfileTextField(
      {Key? key,
      required this.title,
      required this.hint,
      this.filledColor,
      this.readOnly,
      this.fieldController,
      this.fieldValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title),
        SizedBox(
          height: 4.h,
        ),
        TextFormField(
          controller: fieldController,
          readOnly: readOnly ?? false,
          maxLines: 2, // <-- SEE HERE
          minLines: 1,
          validator: fieldValidator,
          decoration: AppStyles.formStyle(hint,
              filledColor: filledColor,
              radius: 8.r,
              borderColor: AppColors.formBorderColor,
              focusBorderColor: AppColors.formBorderColor,
              enabledBorderColor: AppColors.formBorderColor),
        ),
        SizedBox(
          height: 18.h,
        ),
      ]),
    );
  }
}
