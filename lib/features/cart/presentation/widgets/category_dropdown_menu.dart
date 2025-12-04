import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/features/shared/domain/enum/product_category.dart';
import 'package:malina_flutter_project/features/shared/presentation/extension/product_category_ext.dart';

class CategoryDropdownMenu extends StatelessWidget {
  final ValueSetter<ProductCategory> onCategoryChanged;

  CategoryDropdownMenu({
    super.key,
    required this.onCategoryChanged,
  });

  final OutlineInputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.r),
    borderSide: BorderSide(width: 1.w, color: AppColors.greyOutline)
  );

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: MediaQuery.of(context).size.width,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: _inputBorder,
          border: _inputBorder,
        ),
        textStyle: AppStyles.robotoW400GreyMediumDark(AppFontSizes.sp16),
        initialSelection: ProductCategory.food,
        onSelected: (value) {
          if (value != null) {
            onCategoryChanged(value);
          }
        },
        dropdownMenuEntries: List.generate(ProductCategory.values.length, (int index) =>
    DropdownMenuEntry(
        value: ProductCategory.values[index],
        label: ProductCategory.values[index].label.toCapitalize())));
  }
}
