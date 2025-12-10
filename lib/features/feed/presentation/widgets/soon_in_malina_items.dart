import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/context_orientation_ext.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

class SoonInMalinaItems extends StatelessWidget {
  SoonInMalinaItems({super.key});

  final List<Color> _itemsColor = [
    AppColors.blueLight,
    AppColors.orangeSoft,
    AppColors.pinkPale,
    AppColors.mint,
    AppColors.mintDark,
    AppColors.softTeal,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          t.feed.soonInMalina.name,
          style: AppStyles.wixMadeforDisplayW500AlmostBlack(context.isLandscape ? AppFontSizes.sp20 : AppFontSizes.sp17).copyWith(
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 8.w,),
        SizedBox(
          height: 86.w,
          child: ListView.separated(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
              Container(
                width: 86.w,
                height: 86.w,
                padding: EdgeInsets.symmetric(vertical: 6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.isLandscape ? 30.r : 10.r),
                  color: _itemsColor[index],
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(t.feed.soonInMalina.titles[index].toCapitalize(),
                  style: AppStyles.wixMadeforDisplayW400Black(context.isLandscape ? AppFontSizes.sp20 : AppFontSizes.sp12),
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: 10.w,),
              itemCount: _itemsColor.length),
        )
      ],
    );
  }
}
