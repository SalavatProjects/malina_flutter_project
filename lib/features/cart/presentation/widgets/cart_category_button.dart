import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/context_orientation_ext.dart';

class CartCategoryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isActive;
  final String text;

  const CartCategoryButton({
    super.key,
    required this.onPressed,
    required this.isActive,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      sizeStyle: CupertinoButtonSize.small,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.isLandscape ? 60.r :  20.r),
          color: isActive ? AppColors.pink : AppColors.white,
          border: isActive
              ? null
              : Border.all(width: 1.w, color: AppColors.greyExtraLight),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles.wixMadeforDisplayW500White(
              context.isLandscape ? AppFontSizes.sp18 : AppFontSizes.sp16,
            ).copyWith(color: isActive ? AppColors.white : AppColors.greyDark),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
