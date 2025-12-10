import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/context_orientation_ext.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/cart_item_entity.dart';
import 'package:malina_flutter_project/features/shared/domain/entities/product_entity.dart';
import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';
import 'package:malina_flutter_project/gen/assets.gen.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';
import 'package:collection/collection.dart';

class CartProductCard extends StatelessWidget {
  final List<ProductEntity> productsBySubcategory;
  final List<CartItemEntity> cartItems;
  final ValueSetter<int> onIncreasePressed;
  final ValueSetter<int> onDecreasePressed;
  final ValueSetter<int> onRemovePressed;
  final ValueSetter<int>? onAdditivitiesPressed;

  const CartProductCard({
    super.key,
    required this.productsBySubcategory,
    required this.cartItems,
    required this.onIncreasePressed,
    required this.onDecreasePressed,
    required this.onRemovePressed,
    required this.onAdditivitiesPressed,
  });

  double _calculateTotalPrice() {
    double price = 0;
    int quantity = 0;
    if (cartItems.isNotEmpty) {
      for (ProductEntity product in productsBySubcategory) {
        quantity = cartItems.firstWhereOrNull((e) => e.productId == int.parse(product.id))?.quantity ?? 0;

        price += product.price * quantity;

      }
    }
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.isLandscape ? 60.r : 20.r),
        color: AppColors.white
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              Text(productsBySubcategory[0].subcategory, style: AppStyles.wixMadeforDisplayW400GreyDim(
                  context.isLandscape ? AppFontSizes.sp18 : AppFontSizes.sp16),),
              SizedBox(width: 4.w,),
              Icon(Icons.chevron_right_outlined, size: 20.w, color: AppColors.greyDim,)
            ],
          ),
          SizedBox(height: 10.w,),
          Divider(height: 1.w, color: AppColors.greyExtraLight,),
          SizedBox(height: 12.w,),
          Column(
            children: List.generate(productsBySubcategory.length, (int index) {
              final int currentProductQuantity = cartItems.firstWhereOrNull((e) => e.productId.toString() == productsBySubcategory[index].id)?.quantity ?? 0;
              return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 110.w,
                      height: 110.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.softGreyBlue,
                        image: productsBySubcategory[index].imagePath != null ?
                            DecorationImage(image: AssetImage(productsBySubcategory[index].imagePath!)) : null,
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Expanded(
                      child: SizedBox(
                        height: 110.w,
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: .spaceBetween,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.32,
                                      child: Text(productsBySubcategory[index].name, style: AppStyles.wixMadeforDisplayW400AlmostBlack(
                                          context.isLandscape ? AppFontSizes.sp18 :  AppFontSizes.sp14),)),

                                  Text("${productsBySubcategory[index].price} C", style: AppStyles.wixMadeforDisplayW500AlmostBlack(
                                      context.isLandscape ? AppFontSizes.sp17 : AppFontSizes.sp14),)
                                ],
                              ),
                            ),
                            // SizedBox(height: 4.w,),
                            Expanded(
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: Text(productsBySubcategory[index].description, style: AppStyles.wixMadeforDisplayW400Grey(
                                      context.isLandscape ? AppFontSizes.sp16 : AppFontSizes.sp12),)),
                            ),
                            // const Spacer(),
                            Expanded(
                              child: Row(
                                children: [
                                  _IncreaseDecreaseButton(icon: Icons.remove_outlined, onPressed: () {
                                    onDecreasePressed(int.parse(productsBySubcategory[index].id));
                                  }),
                                  SizedBox(width: 8.w,),
                                  Text(currentProductQuantity.toString(), style: AppStyles.wixMadeforDisplayW700AlmostBlack(AppFontSizes.sp18),),
                                  SizedBox(width: 8.w,),
                                  _IncreaseDecreaseButton(icon: Icons.add_outlined, onPressed: () {
                                    onIncreasePressed(int.parse(productsBySubcategory[index].id));
                                  }),
                                  const Spacer(),
                                  CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      sizeStyle: CupertinoButtonSize.small,
                                      child: SvgPicture.asset(Assets.icons.delete.path,
                                      width: 34.w,
                                      ), onPressed: () {
                                        onRemovePressed(int.parse(productsBySubcategory[index].id));
                                  })
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (productsBySubcategory[index].category == ProductCategory.food)
                Padding(
                  padding: EdgeInsets.only(top: 14.w),
                  child: _AdditivitiesButton(onPressed: () {
                    onAdditivitiesPressed?.call(int.parse(productsBySubcategory[index].id));
                  }),
                ),
                SizedBox(height: 20.w,),

              ],
            );
            }),
          ),
          _TotalCard(totalPrice: _calculateTotalPrice()
          // productsBySubcategory.fold(0, (sum, item) => sum + item.price),
          )
        ],
      ),
    );
  }
}

class _IncreaseDecreaseButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _IncreaseDecreaseButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        sizeStyle: CupertinoButtonSize.small,
        child: Container(
          width: 34.w,
          height: 34.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.isLandscape ? 18.r : 9.r),
            color: AppColors.softGreyBlue
          ),
          child: Icon(icon, size: context.isLandscape ? 16.w : 13.w, color: AppColors.black,),
        ), onPressed: onPressed);
  }
}

class _AdditivitiesButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AdditivitiesButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.softGreyBlue,
      ),
      child: Row(
        children: [
          CupertinoButton(
              padding: EdgeInsets.zero,
              sizeStyle: CupertinoButtonSize.small,
              child: Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.w, color: AppColors.green)
                ),
                child: Center(
                  child: Icon(Icons.add_outlined, size: 22.w, color: AppColors.green,),
                ),
              ), onPressed: onPressed,
          ),
          SizedBox(width: 8.w,),
          Text(t.cart.additivies.toCapitalize(), style: AppStyles.wixMadeforDisplayW400AlmostBlack(
              context.isLandscape ? AppFontSizes.sp18 : AppFontSizes.sp16),)
        ],
      ),
    );
  }
}

class _TotalCard extends StatelessWidget {
  final double totalPrice;

  const _TotalCard({
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.isLandscape ? 36.r : 12.r),
        color: AppColors.pink,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(t.cart.total.toCapitalize(), style: AppStyles.wixMadeforDisplayW500White(context.isLandscape ? AppFontSizes.sp18 : AppFontSizes.sp16),),
          Text("${totalPrice.toStringAsFixed(2)} C", style: AppStyles.wixMadeforDisplayW500White(
              context.isLandscape ? AppFontSizes.sp18 : AppFontSizes.sp16),)
        ],
      ),
    );
  }
}
