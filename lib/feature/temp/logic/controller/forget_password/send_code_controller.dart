import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendCodeController extends GetxController {
 final List<TextEditingController> codeControllers = List.generate(4, (_) => TextEditingController());
  RxBool isCodeComplete = false.obs;

  @override
  void onInit() {
    super.onInit();
    for (var controller in codeControllers) {
      controller.addListener(validateCode);
    }
  }

  void validateCode() {
    isCodeComplete.value = codeControllers.every((c) => c.text.trim().isNotEmpty);
  }

  String get fullCode => codeControllers.map((c) => c.text).join();
}