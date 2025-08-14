import 'package:austere/feature/temp/logic/controller/forget_password/forget_password_controller.dart';
import 'package:get/get.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}