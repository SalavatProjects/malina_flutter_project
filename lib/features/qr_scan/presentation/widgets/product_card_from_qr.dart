import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/common/widgets/app_buttons.dart';
import 'package:malina_flutter_project/core/ext/context_orientation_ext.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

class ProductCardFromQr extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onPressed;

  ProductCardFromQr({
    super.key,
    required this.product,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: context.isLandscape ? 10.w : 14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.isLandscape ? 60.r : 20.r),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: .start,
              children: [
                SizedBox(
                  width: context.isLandscape ? 60.w : 100.w,
                  height: context.isLandscape ? 60.w : 100.w,
                  child: product.imagePath != null
                      ? Image.asset(product.imagePath!)
                      : const Center(child: Text("no image")),
                ),
                SizedBox(width: 12.w),
                SizedBox(
                  width: context.isLandscape ? MediaQuery.of(context).size.width * 0.46 : MediaQuery.of(context).size.width * 0.34,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        product.name,
                        style: AppStyles.wixMadeforDisplayW500AlmostBlack(
                          context.isLandscape ? AppFontSizes.sp17 : AppFontSizes.sp16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.w,),
                      Text(product.description, style: AppStyles.wixMadeforDisplayW400Grey(
                          context.isLandscape ? AppFontSizes.sp14 : AppFontSizes.sp12),
                      overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Text("${product.price} C", style: AppStyles.wixMadeforDisplayW500AlmostBlack(
                    context.isLandscape ? AppFontSizes.sp17 : AppFontSizes.sp16),)
              ],
            ),
            // if (context.isPortrait)
            SizedBox(height: 8.w,),
            AppPrimaryButton(
                onPressed: onPressed,
                text: t.action.add.toCapitalize())
          ],
        ),
      ),
    );
  }
}
