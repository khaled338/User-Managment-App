import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/consts/assets.dart';
import 'package:austere/core/routes/app_routes.dart';

import 'package:austere/feature/temp/logic/controller/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
          ), // تحويل padding إلى وحدات responsive
          child: ListView(
            children: [
              SizedBox(height: 24.h),
              Text(
                'Login to your account',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "It's great to see you again.",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xff808080),
                ),
              ),
              SizedBox(height: 32.h),

              /// Email
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            controller.isEmailValid.value
                                ? Colors.green
                                : Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    suffixIcon:
                        controller.isEmailFieldTouched.value
                            ? Icon(
                              controller.isEmailValid.value
                                  ? Icons.check_circle
                                  : Icons.error,
                              color:
                                  controller.isEmailValid.value
                                      ? Colors.green
                                      : Colors.red,
                            )
                            : null,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              /// Password
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => TextField(
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordHidden.value,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            controller.isPasswordValid.value
                                ? Colors.green
                                : Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (controller.isPasswordFieldTouched.value)
                          Icon(
                            controller.isPasswordValid.value
                                ? Icons.check_circle
                                : Icons.error,
                            color:
                                controller.isPasswordValid.value
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        IconButton(
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.offNamed(AppRoutes.forgetPassword);
                  },
                  child: Text(
                    'Reset your password',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryText,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              /// Login Button
              Obx(
                () => ElevatedButton(
                 onPressed: controller.isFormValid.value
        ? () {
            controller.login();
          }
        : null,
                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        controller.isFormValid.value
                            ? AppColors.primary
                            : const Color(0xffCCCCCC),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 22.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              /// Or divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: const Color(0xFFE6E6E6),
                      thickness: 1.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      'Or',
                      style: TextStyle(
                        color: const Color(0xff808080),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: const Color(0xFFE6E6E6),
                      thickness: 1.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              /// Google Button
              OutlinedButton.icon(
                onPressed: () {
                },
                icon: Image.asset(Assets.googleIcon, height: 24.h),
                label: Text(
                  'Login with Google',
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16.sp,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 22.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 12.h),

              // Facebook Button
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.facebook, color: Colors.white, size: 24.h),
                label: Text(
                  'Login with Facebook',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1877F2),
                  padding: EdgeInsets.symmetric(vertical: 22.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),

              SizedBox(height: 160.h + MediaQuery.of(context).padding.bottom),

              /// Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                      color: const Color(0xff808080),
                      fontSize: 14.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.SignUp);
                    },
                    child: Text(
                      'Join',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
