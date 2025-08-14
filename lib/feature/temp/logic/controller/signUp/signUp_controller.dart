import 'package:austere/core/routes/app_routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isPasswordHidden = true.obs;
  RxBool isFormValid = false.obs;

  RxBool isNameValid = false.obs;
  RxBool isEmailValid = false.obs;
  RxBool isPasswordValid = false.obs;

  RxBool isNameFieldTouched = false.obs;
  RxBool isEmailFieldTouched = false.obs;
  RxBool isPasswordFieldTouched = false.obs;

  @override
  void onInit() {
    super.onInit();

    nameController.addListener(() {
      isNameFieldTouched.value = true;
      validateForm();
    });
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
    isNameValid.value =
        nameController.text.trim().length >= 3 && nameController.text.isNotEmpty;
    isEmailValid.value = GetUtils.isEmail(emailController.text.trim());
    isPasswordValid.value = passwordController.text.trim().length >= 6;

    isFormValid.value =
        isNameValid.value && isEmailValid.value && isPasswordValid.value;
  }

Future<void> signUp() async {
    try {
      print("Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr: ${isFormValid.value}");
      
      // إنشاء حساب في Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        
      );

      // حفظ بيانات المستخدم في Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
      });
           
      Get.snackbar('Success', 'Account created successfully 🎉');
      // ممكن تروح لصفحة البروفايل أو الهوم
       Get.offAllNamed(AppRoutes.login);

    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Something went wrong');
      print("Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr: ${e.message}");
    } catch (e) {
      Get.snackbar('Error', e.toString());
      
    }
  }

}