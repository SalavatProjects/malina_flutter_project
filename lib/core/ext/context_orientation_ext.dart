import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/core/common/theme/theme.dart';

extension ContextOrientationExt on BuildContext {
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  /*double get widthToHeight => isLandscape ? MediaQuery.of(this).size.width : MediaQuery.of(this).size.height;
  double get sp17toSp16 => isLandscape ? AppFontSizes.sp17 : AppFontSizes.sp16;
  double get sp17toSp14 => isLandscape ? AppFontSizes.sp17 : AppFontSizes.sp14;
  double get sp16toSp12 => isLandscape ? AppFontSizes.sp16 : AppFontSizes.sp12;
  double get w14toW20 => isLandscape ? 14.w : 20.w;
  double get w4to14w => isLandscape ? 14.w : 4.w;
  double get r124toR24 => isLandscape ? 124.r : 24.r;*/
}