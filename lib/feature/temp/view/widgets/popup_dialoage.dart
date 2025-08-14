import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/consts/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showSuccessDialog(BuildContext context) {
 showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ✅ دائرة بالأيقونة
            Container(
              padding: EdgeInsets.all(16.w),
              child: Image.asset(
                Assets.correctDialoageScreen,
                width: 80.w,
                height: 80.w,
              ),
            ),

            SizedBox(height: 7.h),

            // ✅ العنوان
            Text(
              'Password Changed!',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 12.h),

            // ✅ الوصف
            Text(
              'Your can now use your new password to login to\n your account.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff808080),
              ),
            ),

            SizedBox(height: 24.h),

            // ✅ زرار Login
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.back(); // يقفل الـ Dialog
                  Get.offAllNamed('/login'); // يروح لصفحة اللوجن
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}