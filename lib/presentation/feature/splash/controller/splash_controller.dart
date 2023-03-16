import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/core/helper/auth_helper.dart';
import 'package:kardusinfo_todo_app/core/router/route_name.dart';

class SplashController extends GetxController {
  late AuthHelper authHelper;

  @override
  void onInit() async {
    authHelper = Get.find<AuthHelper>();
    var isLoggedIn = await checkUser();
    if (isLoggedIn) {
      Get.offNamed(RouteName.note);
    } else {
      Get.offNamed(RouteName.login);
    }

    super.onInit();
  }

  Future<bool> checkUser() async {
    return authHelper.isUserLoggedIn();
  }
}
