import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/common/widgets/app_buttons.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: .start,
              children: [
                SizedBox(
                  width: 100.w,
                  height: 100.w,
                  child: product.imagePath != null
                      ? Image.asset(product.imagePath!)
                      : const Center(child: Text("no image")),
                ),
                SizedBox(width: 12.w),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.34,
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        product.name,
                        style: AppStyles.wixMadeforDisplayW500AlmostBlack(
                          AppFontSizes.sp16,
                        ),
                      ),
                      SizedBox(height: 4.w,),
                      Text(product.description, style: AppStyles.wixMadeforDisplayW400Grey(AppFontSizes.sp12),)
                    ],
                  ),
                ),
                Text("${product.price} C", style: AppStyles.wixMadeforDisplayW500AlmostBlack(AppFontSizes.sp16),)
              ],
            ),
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
