import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:malina_flutter_project/core/common/theme/theme.dart';

class NavBarItem extends StatelessWidget {
  final int index;
  final String iconPath;
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  const NavBarItem({
    super.key,
    required this.index,
    required this.iconPath,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      sizeStyle: CupertinoButtonSize.small,
      child: SizedBox(
        width: 54.w,
        height: 40.w,
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 25.w,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.pink : AppColors.greyLight,
                BlendMode.srcIn,
              ),
            ),
            Text(
              text,
              style: AppStyles.wixMadeforDisplayW500White(AppFontSizes.sp10)
                  .copyWith(
                color: isActive ? AppColors.pink : AppColors.greyMedium,
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
