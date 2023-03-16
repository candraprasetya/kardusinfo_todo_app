import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/presentation/feature/signup/controller/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
