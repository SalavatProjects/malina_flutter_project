import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/context_orientation_ext.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueSetter<String> onTextChanged;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function()? onSuffixIconTap;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  AppTextFormField({
    super.key,
    required this.textEditingController,
    required this.onTextChanged,
    this.hintText,
    this.errorText,
    this.suffixIcon,
    this.onSuffixIconTap,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
  }) : obscureText = false;

  AppTextFormField.password({
    super.key,
    required this.textEditingController,
    required this.onTextChanged,
    this.hintText,
    this.errorText,
    required this.obscureText,
    required this.suffixIcon,
    required this.onSuffixIconTap,
    this.validator,
    this.keyboardType,
  }) : inputFormatters = null;

  final OutlineInputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.r),
    borderSide: BorderSide(width: 1.w, color: AppColors.greyOutline),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 66.w,
      child: TextFormField(
        controller: textEditingController,
        obscureText: obscureText,
        maxLength: AppConstants.maxTextFieldLength,
        style: AppStyles.robotoW400AlmostBlack(context.isLandscape ? AppFontSizes.sp17 : AppFontSizes.sp16),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.w,
          ),
          border: _inputBorder,
          focusedBorder: _inputBorder,
          hintText: hintText,
          hintStyle: AppStyles.robotoW400GreyMediumDark(context.isLandscape ? AppFontSizes.sp17 : AppFontSizes.sp16),
          suffixIcon: suffixIcon != null
              ? GestureDetector(onTap: onSuffixIconTap, child: suffixIcon)
              : null,
          isDense: true,
          errorStyle: AppStyles.robotoW400AlmostBlack(
            context.isLandscape ? AppFontSizes.sp16 : AppFontSizes.sp12,
          ).copyWith(color: AppColors.error),
        ),
        inputFormatters: inputFormatters,
        validator: validator,
        buildCounter:
            (
              context, {
              required currentLength,
              required maxLength,
              required isFocused,
            }) {
              return null;
            },
      ),
    );
  }
}
