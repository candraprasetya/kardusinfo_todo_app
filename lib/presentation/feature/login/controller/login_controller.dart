import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/core/helper/auth_helper.dart';

import '../../../../core/router/route_name.dart';

class LoginController extends GetxController {
  late AuthHelper authHelper;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    authHelper = Get.find<AuthHelper>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> signIn() async {
    isLoading = true;
    try {
      var email = emailController.text;
      var password = passwordController.text;
      var isSuccessLogin = await authHelper.signIn(email, password);

      if (isSuccessLogin) {
        Get.offAllNamed(RouteName.note);
      } else {
        Get.snackbar('Error', 'Email or password is wrong');
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading = false;
  }
}
