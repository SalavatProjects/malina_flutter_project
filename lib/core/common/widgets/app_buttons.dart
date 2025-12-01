import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';

abstract class _AppCupertinoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isActive;
  final Color backgroundColor;
  final TextStyle textStyle;

  const _AppCupertinoButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isActive,
    required this.backgroundColor,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: .zero,
      sizeStyle: CupertinoButtonSize.small,
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.w,
        // padding: EdgeInsets.symmetric(vertical: 10.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

class AppPrimaryButton extends _AppCupertinoButton {
  AppPrimaryButton({
    super.key,
    required super.onPressed,
    required super.text,
  }) : super (
    isActive: true,
    backgroundColor: AppColors.pink,
    textStyle: AppStyles.robotoW500White(AppFontSizes.sp14)
  );
}
