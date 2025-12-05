import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/gen/assets.gen.dart';

class NavBarScanButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isToBack;

  const NavBarScanButton({
    super.key,
    required this.onPressed,
    required this.isToBack,
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
          color: AppColors.pink,
        ),
        child: Center(
          child: SvgPicture.asset(
            isToBack
                ? Assets.icons.categoryActive.path
                : Assets.icons.categoryInactive.path,
            width: 48.w,
            colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
