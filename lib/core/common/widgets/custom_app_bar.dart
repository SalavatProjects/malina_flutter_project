import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onActionPressed;
  final String actionText;
  final String title;

  const CustomAppBar({
    super.key,
    required this.onActionPressed,
    required this.actionText,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        sizeStyle: CupertinoButtonSize.small,
        child: Icon(
          Icons.chevron_left,
          size: 30.w,
          color: AppColors.almostBlack,
        ),
        onPressed: () {
          context.pop();
        },
      ),
      title: Text(title),
      titleTextStyle: AppStyles.wixMadeforDisplayW700AlmostBlack(
        AppFontSizes.sp20,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            sizeStyle: CupertinoButtonSize.small,
            child: Text(actionText, style: AppStyles.wixMadeforDisplayW400AlmostBlack(AppFontSizes.sp14),),
            onPressed: onActionPressed,
          ),
        ),
      ],
    );
  }
}
