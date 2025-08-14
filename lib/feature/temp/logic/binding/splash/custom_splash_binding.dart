import 'package:austere/feature/temp/logic/controller/splash/custom_splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomSplashController());
  }
}