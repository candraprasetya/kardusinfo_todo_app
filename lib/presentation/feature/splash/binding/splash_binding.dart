import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/presentation/feature/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
