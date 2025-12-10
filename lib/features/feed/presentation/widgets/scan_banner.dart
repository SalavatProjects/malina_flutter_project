import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/context_orientation_ext.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

import '../../../../gen/assets.gen.dart';

class ScanBanner extends StatelessWidget {
  const ScanBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90.w,
      padding: EdgeInsets.symmetric(vertical: 11.w, horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.isLandscape ? 36.r : 12.r),
        color: AppColors.pink,
      ),
      child: Row(
        children: [
          Assets.icons.phoneScan.svg(
            width: 36.w,
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 17.w),
          Expanded(
            child: Text(
              t.feed.scanQr,
              style: AppStyles.wixMadeforDisplayW500White(AppFontSizes.sp16),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(width: 20.w,)
        ],
      ),
    );
  }
}
