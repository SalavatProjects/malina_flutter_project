import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';

class FeedProductBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color backgroundColor;


  const FeedProductBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 170.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 23.w),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath)),
        borderRadius: BorderRadius.circular(12.r),
        color: backgroundColor
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(title, style: AppStyles.robotoW600Black(AppFontSizes.sp22),),
          SizedBox(height: 10.w,),
          SizedBox(
            width: 140.w,
            child: Text(
              subtitle,
              style: AppStyles.robotoW300Black(AppFontSizes.sp16),

            ),
          )
        ],
      ),
    );
  }
}
