import 'package:austere/feature/temp/logic/controller/user_list/user_list_controller.dart';
import 'package:get/get.dart';

class UsersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersListController());
  }
}