import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/context_orientation_ext.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

import 'package:malina_flutter_project/gen/assets.gen.dart';

class SearchInMalina extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueSetter<String> onChanged;

  SearchInMalina({
    super.key,
    required this.textEditingController,
    required this.onChanged,
  });

  OutlineInputBorder _inputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(context.isLandscape ? 24.r : 12.r),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      maxLength: AppConstants.maxTextFieldLength,
      style: AppStyles.wixMadeforDisplayW400Black(context.isLandscape ? AppFontSizes.sp16 : AppFontSizes.sp14),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 14.w),
        border: _inputBorder(context),
        focusedBorder: _inputBorder(context),
        // isDense: true,
        filled: true,
        fillColor: AppColors.white,
        hintText: t.feed.search,
        hintStyle: AppStyles.wixMadeforDisplayW400DarkGrey(context.isLandscape ? AppFontSizes.sp16 : AppFontSizes.sp14),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 12.w, right: 2.w),
          child: Assets.icons.search.svg(
            colorFilter: const ColorFilter.mode(
              AppColors.darkGrey,
              BlendMode.srcIn,
            ),
            width: 20.w
          ),
        ),
        prefixIconConstraints: BoxConstraints(maxWidth: 28.w, maxHeight: 25.w),
      ),
      buildCounter:
          (
            context, {
            required currentLength,
            required maxLength,
            required isFocused,
          }) {
            return null;
          },
    );
  }
}
