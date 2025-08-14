// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:austere/core/utils/screen_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:karwahoutside/core/utils/screen_config.dart';

const double kWidth = 430;
const double kHeight = 932;

extension DoubleExtensions on num {
  double get h {
    return (this / kHeight) * SizeConfig.screenHeight;
  }

  double get w {
    return (this / kWidth) * SizeConfig.screenWidth;
  }

  double get sp {
    return SizeConfig.textScaler.scale(toDouble());
  }

  double get sw {
    return SizeConfig.screenWidth;
  }

  double get sh {
    return SizeConfig.screenHeight;
  }

  double get r {
    final screenWidth = Get.width;
    final screenHeight = Get.height;
    return this * min((screenWidth / kWidth), (screenHeight / kHeight));
  }

  SizedBox get verticalSpace {
    return SizedBox(height: (this / kHeight) * SizeConfig.screenHeight);
  }

  SizedBox get horizontalSpace {
    return SizedBox(width: (this / kWidth) * SizeConfig.screenWidth);
  }
}

extension EdgeInsetsExtension on EdgeInsets {
  /// Creates adapt insets using r [SizeExtension].
  EdgeInsets get r => copyWith(
        top: top.r,
        bottom: bottom.r,
        right: right.r,
        left: left.r,
      );

  EdgeInsets get w => copyWith(
        top: top.w,
        bottom: bottom.w,
        right: right.w,
        left: left.w,
      );

  EdgeInsets get h => copyWith(
        top: top.h,
        bottom: bottom.h,
        right: right.h,
        left: left.h,
      );

  EdgeInsets get p => copyWith(
        top: top.h,
        bottom: bottom.h,
        right: right.w,
        left: left.w,
      );
}
