import 'package:austere/feature/temp/logic/controller/forget_password/reset_password_controller.dart';
import 'package:get/get.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}