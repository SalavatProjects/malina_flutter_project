import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/constants/app_constants.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';
import 'package:malina_flutter_project/core/ext/string_ext.dart';
import 'package:malina_flutter_project/gen/strings.g.dart';

class CartProductDescriptionTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueSetter<String> onTextChanged;
  final String? Function(String?)? validator;

  CartProductDescriptionTextField({
    super.key,
    required this.textEditingController,
    required this.onTextChanged,
    this.validator
  });

  final OutlineInputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.r),
    borderSide: BorderSide(width: 1.w, color: AppColors.greyOutline)
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(t.common.description.toCapitalize(), style: AppStyles.robotoW400GreyMediumDark(AppFontSizes.sp16),),
        SizedBox(height: 12.w,),
        TextFormField(
          controller: textEditingController,
          style: AppStyles.robotoW400AlmostBlack(AppFontSizes.sp16),
          maxLines: 9,
          maxLength: AppConstants.maxLongTextFieldLength,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.w),
            border: _inputBorder,
            focusedBorder: _inputBorder,
          ),
          validator: validator,
          buildCounter: (context, {required currentLength, required maxLength, required isFocused}) {
            return null;
          },
        )
      ],
    );
  }
}
