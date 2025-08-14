import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  RxBool isEmailValid = false.obs;
  RxBool isEmailFieldTouched = false.obs;

  @override
  void onInit() {
    super.onInit();
        emailController.addListener(() {
      isEmailFieldTouched.value = true;
       // أول ما المستخدم يكتب
    });
    emailController.addListener(_validateEmail);
  }

  void _validateEmail() {
   isEmailValid.value = GetUtils.isEmail(emailController.text.trim());
  }
}