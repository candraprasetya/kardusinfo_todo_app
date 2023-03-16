import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/presentation/feature/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
