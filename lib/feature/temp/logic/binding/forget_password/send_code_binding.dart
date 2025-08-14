import 'package:austere/feature/temp/logic/controller/forget_password/send_code_controller.dart';
import 'package:get/get.dart';

class SendCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendCodeController());
  }
}