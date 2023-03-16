import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/core/router/route_name.dart';
import 'package:kardusinfo_todo_app/presentation/feature/login/controller/login_controller.dart';
import 'package:kardusinfo_todo_app/presentation/widget/app_textfield.dart';

import '../../widget/app_button.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo
          Center(
            child: Hero(
              tag: 'applogo',
              child: Image.asset(
                'assets/images/logo.png',
                width: Get.width * .5,
              ),
            ),
          ),

          // Text Login to Your Account
          const SizedBox(height: 55),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Login to your account",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Email Text Input
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: AppTextField(
              controller: controller.emailController,
              hintText: 'Email',
            ),
          ),

          // Password Text Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: AppTextField(
              controller: controller.passwordController,
              hintText: 'Password',
              isObsecure: true,
            ),
          ),

          // Login Button
          const SizedBox(height: 20),
          Obx(() => Container(
                width: Get.width,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AppButton(
                  disabled: controller.isLoading,
                  onPressed: () async {
                    await controller.signIn();
                  },
                  text: 'Login',
                  child: controller.isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
              )),

          // Sign Up Button
          const SizedBox(height: 20),
          Center(
            child: Text.rich(
              TextSpan(
                text: 'Don\'t have an account? ',
                style: const TextStyle(
                  color: Colors.grey,
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(RouteName.signUp)?.then((value) {
                          log("result: $value");
                        });
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
