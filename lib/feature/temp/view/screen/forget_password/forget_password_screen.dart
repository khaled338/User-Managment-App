import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/routes/app_routes.dart';
import 'package:austere/feature/temp/logic/controller/forget_password/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              SizedBox(height: 16.h),

              // 🔙 زر الرجوع
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.w),
                  onPressed: () => Get.back(),
                ),
              ),
              SizedBox(height: 8.h),

              // 📝 العنوان
              Text(
                'Forgot password',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),

              // 📄 الوصف
              Text(
                'Enter your email for the verification process.\nWe will send 4 digits code to your email.',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: const Color(0xff808080),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),

              // 📧 تسمية البريد الإلكتروني
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),

              // 📧 حقل إدخال البريد الإلكتروني
              Obx(() => TextField(
                    controller: controller.emailController,
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintText: 'Enter your email address',
                      hintStyle: TextStyle(color: const Color(0xFFAAAAAA), fontSize: 16.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: controller.isEmailValid.value ? Colors.green : Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      suffixIcon: controller.isEmailFieldTouched.value
                          ? Icon(
                              controller.isEmailValid.value ? Icons.check_circle : Icons.error,
                              color: controller.isEmailValid.value ? Colors.green : Colors.red,
                              size: 20.w,
                            )
                          : null,
                    ),
                  ),
              ),
              SizedBox(height: 32.h),

              // 📤 زر إرسال الكود
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isEmailValid.value
                      ? () {
                          Get.toNamed(AppRoutes.sendCode);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isEmailValid.value
                        ? AppColors.primary
                        : const Color(0xffCCCCCC),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(0xffCCCCCC),
                    padding: EdgeInsets.symmetric(vertical: 22.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Send Code',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}