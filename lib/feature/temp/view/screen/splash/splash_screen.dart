import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/consts/assets.dart';
import 'package:austere/feature/temp/logic/controller/splash/custom_splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomSplashController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 20.h,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    Assets.waveSplashScreen,
                    fit: BoxFit.cover,
                    width: 1.sw, // عرض كامل للشاشة
                  ),
                ),
                Center(
                  child: Image.asset(
                    Assets.splashScreen,
                    width: 100.w,
                    height: 100.w, // استخدام نفس القيمة للعرض والارتفاع للحفاظ على التناسب
                  ),
                ),
                Positioned(
                  bottom: 40.h,
                  left: 0,
                  right: 0,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}