import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/core/helper/auth_helper.dart';

class SignUpController extends GetxController {
  late AuthHelper authHelper;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  @override
  void onInit() {
    authHelper = Get.find<AuthHelper>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  Future<bool> signUp() async {
    bool result = false;
    isLoading = true;
    try {
      if (passwordController.text != confirmPasswordController.text) {
        Get.snackbar('Error', 'Password and Confirm Password not match');
        throw 'Password and Confirm Password not match';
      }
      var email = emailController.text;
      var password = passwordController.text;
      await authHelper.signUp(email, password);
      result = true;
    } catch (e) {
      result = false;
      log(e.toString());
    }
    isLoading = false;
    return result;
  }
}
