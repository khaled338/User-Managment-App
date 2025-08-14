import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/feature/temp/logic/controller/forget_password/reset_password_controller.dart';
import 'package:austere/feature/temp/view/widgets/popup_dialoage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  final ResetPasswordController controller = Get.put(ResetPasswordController());

  ResetPasswordScreen({super.key});

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

              /// 🔙 زر الرجوع
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 24.w),
                  onPressed: () => Get.back(),
                ),
              ),

              SizedBox(height: 8.h),

              /// 📝 العنوان
              Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 8.h),

              /// 📄 الوصف
              Text(
                'Set the new password for your account so you\n can login and access all the features.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff808080),
                  height: 1.5,
                ),
              ),
              SizedBox(height: 32.h),

              /// 🔒 حقل كلمة المرور
              Text(
                'Password',
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
                  obscureText: !controller.isPasswordVisible.value,
                  obscuringCharacter: '•',
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  decoration: InputDecoration(
                    hintText: 'Enter new password',
                    hintStyle: TextStyle(color: const Color(0xffAAAAAA), fontSize: 16.sp),
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
                        if (controller.isNewPasswordTouched.value)
                          Icon(
                            controller.isPasswordValid.value
                                ? Icons.check_circle
                                : Icons.error,
                            color: controller.isPasswordValid.value
                                ? Colors.green
                                : Colors.red,
                            size: 20.w,
                          ),
                        IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                            size: 20.w,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              /// 🔒 حقل تأكيد كلمة المرور
              Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => TextField(
                  controller: controller.confirmPasswordController,
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  obscuringCharacter: '•',
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  decoration: InputDecoration(
                    hintText: 'Confirm password',
                    hintStyle: TextStyle(color: const Color(0xffAAAAAA), fontSize: 16.sp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: controller.isConfirmPasswordValid.value
                            ? Colors.green
                            : Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (controller.isConfirmPasswordTouched.value)
                          Icon(
                            controller.isConfirmPasswordValid.value
                                ? Icons.check_circle
                                : Icons.error,
                            color: controller.isConfirmPasswordValid.value
                                ? Colors.green
                                : Colors.red,
                            size: 20.w,
                          ),
                        IconButton(
                          icon: Icon(
                            controller.isConfirmPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                            size: 20.w,
                          ),
                          onPressed: controller.toggleConfirmPasswordVisibility,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              /// ✅ زر المتابعة
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isFormValid.value
                      ? () {
                          showSuccessDialog(context);
                          print(
                            "New Password: ${controller.passwordController.text}",
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isFormValid.value
                        ? Colors.black
                        : const Color(0xffCCCCCC),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(0xffCCCCCC),
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Continue',
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
