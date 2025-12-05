import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:malina_flutter_project/core/common/theme/theme.dart';

class CustomNavBar extends StatelessWidget {
  final List<Widget> items;

  const CustomNavBar({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 5.w),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r)),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                spreadRadius: 5,
                offset: const Offset(0, -10)
            )
          ]
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: items,
      ),
    );
  }
}
