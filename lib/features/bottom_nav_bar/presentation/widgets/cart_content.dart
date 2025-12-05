
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

import '../../../../gen/assets.gen.dart';

class CartContent extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onFoodPressed;
  final VoidCallback onBeautyPressed;

  const CartContent({
    super.key,
    required this.isOpen,
    required this.onFoodPressed,
    required this.onBeautyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 70.w,
      height: isOpen ? 136.w : 0,
      padding: EdgeInsets.only(top: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.r),
          topLeft: Radius.circular(50.r),
        ),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: -5,
            offset: const Offset(0, -15),
          ),
        ],
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            _CircleButton(
              onPressed: onFoodPressed,
              iconPath: Assets.icons.food.path,
              text: t.feed.food.name.toCapitalize(),
            ),
            SizedBox(height: 10.w,),
            _CircleButton(
                onPressed: onBeautyPressed,
                iconPath: Assets.icons.cosmetic.path, text: t.feed.beauty.name.toCapitalize())
          ],
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final String text;

  const _CircleButton({
    required this.onPressed,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      sizeStyle: CupertinoButtonSize.small,
      child: Container(
        width: 60.w,
        height: 60.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.greySoft,
        ),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            SvgPicture.asset(iconPath, width: 22.w, colorFilter: const ColorFilter.mode(AppColors.almostBlack, BlendMode.srcIn),),
            Text(text, style: AppStyles.wixMadeforDisplayW400AlmostBlack(AppFontSizes.sp10),)
          ],
        ),
      ),
    );
  }
}
