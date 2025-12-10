import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/context_orientation_ext.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

class ClearCartItemsDialog extends StatelessWidget {
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  const ClearCartItemsDialog({
    super.key,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.isLandscape ? 40.r : 20.r),
          border: Border.all(width: 1.w, color: AppColors.grey),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Text(
                t.profile.clearCartItemsBeforeLogout,
                style: AppStyles.wixMadeforDisplayW500AlmostBlack(
                  context.isLandscape ? AppFontSizes.sp22 : AppFontSizes.sp18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 4.w),
            Divider(height: 1.w, color: AppColors.greyExtraLight,),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                _YesNoButton(
                  onPressed: onYesPressed,
                  text: t.action.yes.toCapitalize(),
                  textColor: AppColors.green,
                ),
                const _VerticalDivider(),
                _YesNoButton(
                  onPressed: onNoPressed,
                  text: t.action.no.toCapitalize(),
                  textColor: AppColors.error,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _YesNoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;

  const _YesNoButton({
    required this.onPressed,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(
        text,
        style: AppStyles.robotoW400AlmostBlack(context.isLandscape ? AppFontSizes.sp22 : AppFontSizes.sp20).copyWith(
          color: textColor
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.w,
      height: 40.w,
      color: AppColors.greyExtraLight,
    );
  }
}
