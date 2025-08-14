import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isPasswordHidden = true.obs;
  RxBool isFormValid = false.obs;

  RxBool isEmailValid = false.obs;
  RxBool isPasswordValid = false.obs;
  RxBool isEmailFieldTouched = false.obs;
  RxBool isPasswordFieldTouched = false.obs;

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(() {
      isEmailFieldTouched.value = true;
      validateForm();
    });

    passwordController.addListener(() {
      isPasswordFieldTouched.value = true;
      validateForm();
    });
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void validateForm() {
    isEmailValid.value = GetUtils.isEmail(emailController.text.trim());
    isPasswordValid.value = passwordController.text.trim().length >= 6;
    isFormValid.value = isEmailValid.value && isPasswordValid.value;
  }

 Future<void> login() async {
  if (!isFormValid.value) return;
  print("isFormValid: ${isFormValid.value}");

  try {
    // Show loading
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    // تسجيل الدخول
    UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    // جلب بيانات المستخدم من Firestore
    final uid = credential.user!.uid;
    final snapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (snapshot.exists) {
      final userData = snapshot.data()!;
      print("User Data: $userData");

      // ممكن تخزن البيانات في GetStorage أو Controller تاني
    }

    // Close loading
    Get.back();

    // Navigate to home
    Get.offAllNamed('/home');

  } on FirebaseAuthException catch (e) {
    Get.back();
    Get.snackbar(
      "Login Failed",
      e.message ?? "Unknown error occurred",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
    );
  } catch (e) {
    Get.back();
    Get.snackbar(
      "Error",
      e.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
    );
  }
}
}