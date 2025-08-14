import 'package:austere/core/consts/app_colors.dart';
import 'package:austere/core/routes/app_routes.dart';
import 'package:austere/feature/temp/logic/controller/forget_password/send_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SendCodeScreen extends StatelessWidget {
  final SendCodeController controller = Get.put(SendCodeController());
  SendCodeScreen({super.key});
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
                'Enter 4 Digit Code',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),

              // 📄 الوصف
              Text(
                'Enter 4 digit code that you receive on your\nemail (cody.fisher45@example.com).',
                style: TextStyle(fontSize: 16.sp, color: const Color(0xff808080)),
              ),

              SizedBox(height: 32.h),

              // 🔢 حقول إدخال الكود
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 60.w,
                    child: TextField(
                      controller: controller.codeControllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: Color(0xffE6E6E6),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: AppColors.primaryText,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      },
                    ),
                  );
                }),
              ),

              SizedBox(height: 16.h),

              // 🔁 إعادة إرسال الكود
              Center(
                child: GestureDetector(
                  onTap: () {
                    // TODO: إضافة منطق إعادة الإرسال
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Email not received? ",
                        style: TextStyle(
                          color: const Color(0xff808080),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Resend code',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryText,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 32.h),
              
              // ✅ زر المتابعة
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isCodeComplete.value
                      ? () {
                          final enteredCode = controller.fullCode;
                          print('Code entered: $enteredCode');
                          Get.toNamed(AppRoutes.resetPassword);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: const Color(0xffCCCCCC),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 22.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
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