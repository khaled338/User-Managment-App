import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToastManager {
  static void showError(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(Get.context!).size.height - 200,
          left: 20,
          right: 20,
        ),
      ),
    );
  }

  static void showSuccess(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(Get.context!).size.height - 150,
          left: 20,
          right: 20,
        ),
      ),
    );
  }

  static void showLoading(BuildContext context) {
    //dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void stopLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
