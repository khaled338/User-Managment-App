import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/consts/assets.dart';
import 'package:austere/core/routes/app_routes.dart';
import 'package:austere/feature/temp/logic/controller/signUp/signUp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ListView(
            children: [
              SizedBox(height: 24.h),

              // Title
              Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Let's create your account.",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xff808080),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 32.h),

              // Full Name
              Text(
                "Full Name",
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
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: controller.isNameValid.value
                            ? Colors.green
                            : Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    suffixIcon: controller.isNameFieldTouched.value
                        ? Icon(
                            controller.isNameValid.value
                                ? Icons.check_circle
                                : Icons.error,
                            color: controller.isNameValid.value
                                ? Colors.green
                                : Colors.red,
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

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
                        color: controller.isEmailValid.value
                            ? Colors.green
                            : Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    suffixIcon: controller.isEmailFieldTouched.value
                        ? Icon(
                            controller.isEmailValid.value
                                ? Icons.check_circle
                                : Icons.error,
                            color: controller.isEmailValid.value
                                ? Colors.green
                                : Colors.red,
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 16.h),

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
                  controller: controller.passwordController,
                  obscureText: controller.isPasswordHidden.value,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: controller.isPasswordValid.value
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
                            color: controller.isPasswordValid.value
                                ? Colors.green
                                : Colors.red,
                          ),
                        IconButton(
                          icon: Icon(
                            controller.isPasswordHidden.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Terms text
              Text.rich(
                TextSpan(
                  text: 'By signing up you agree to our ',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(text: ', '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ',\n and ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Cookie Use',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Create Account Button
              Obx(
                () => ElevatedButton(
                 onPressed: controller.isFormValid.value
        ? () async {
            await controller.signUp();
          }
        : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isFormValid.value
                        ? AppColors.primary
                        : const Color(0xffCCCCCC),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 22.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Create an Account',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              // Divider
              Row(
                children: [
                  Expanded(child: Divider(color: const Color(0xFFE6E6E6), thickness: 1.h)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: const Color(0xFFE6E6E6), thickness: 1.h)),
                ],
              ),
              SizedBox(height: 16.h),

              // Google Button
              OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  Assets.googleIcon,
                  height: 24.h,
                ),
                label: Text(
                  'Sign Up with Google',
                  style: TextStyle(color: AppColors.primaryText, fontSize: 16.sp),
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
                  'Sign Up with Facebook',
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

              SizedBox(height: 24.h),

              // Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff808080),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Text(
                      "Log In",
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

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
