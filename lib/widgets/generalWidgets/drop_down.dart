import 'package:ezcredit/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MainDropDownMenu extends StatelessWidget {
  final List<String> items;
  final double? width;
  final Widget? icon;
  final String hint;
  final String? value;
  final String? errorText;
  final String? Function(String?)? validator;
  final ValueChanged onChanged;
  final FocusNode? focusNode;
  final bool disabled;
  const MainDropDownMenu(
      {Key? key,
      required this.items,
      this.width,
      this.icon,
      required this.hint,
      this.errorText,
      this.validator,
      required this.onChanged,
      this.value,
      this.focusNode,
      this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        disabledHint: Text("disanled"),
        isExpanded: true,
        autofocus: false,
        value: value,
        focusNode: focusNode,
        hint: Text(
          hint,
          style: TextStyle(color: AppColors.grey),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.formBorderColor),
          ),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.red)),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: AppColors.formBorderColor),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        icon: const Icon(Icons.arrow_drop_down),
        style: const TextStyle(color: Colors.black),
        validator: validator,
        items: items
            .map(
              (value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
        onChanged: disabled ? null : onChanged);
  }
}
