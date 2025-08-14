import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxBool isFormValid = false.obs;
  RxBool isNewPasswordTouched = false.obs;
RxBool isConfirmPasswordTouched = false.obs;
RxBool isPasswordValid = false.obs;
RxBool isConfirmPasswordValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    passwordController.addListener(() {
    isNewPasswordTouched.value = true; // ✅ هنا
    validateForm();
  });
    confirmPasswordController.addListener(() {
    isConfirmPasswordTouched.value = true; // ✅ هنا
    validateForm();
  });
    passwordController.addListener(validateForm);
    confirmPasswordController.addListener(validateForm);
  }

  void validateForm() {
    final password = passwordController.text.trim();
    final confirm = confirmPasswordController.text.trim();
    isPasswordValid.value = password.length >= 6;
    isConfirmPasswordValid.value = confirm == password && confirm.length >= 6;

    isFormValid.value = isPasswordValid.value && isConfirmPasswordValid.value;

    isFormValid.value = password.isNotEmpty &&
        confirm.isNotEmpty &&
        password == confirm;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
}