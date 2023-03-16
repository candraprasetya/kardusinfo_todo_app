import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/presentation/feature/signup/controller/signup_controller.dart';

import '../../widget/app_button.dart';
import '../../widget/app_textfield.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (controller.isLoading) {
          return Future.value(false);
        } else {
          Get.back();
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
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
                "Create your account",
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

            // Password Confirmation Text Input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: AppTextField(
                controller: controller.confirmPasswordController,
                hintText: 'Password Confirmation',
                isObsecure: true,
              ),
            ),

            // Sign Up Button
            const SizedBox(height: 20),
            Obx(
              () => Container(
                width: Get.width,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: AppButton(
                  disabled: controller.isLoading,
                  onPressed: () async {
                    bool signup = await controller.signUp();
                    Get.back<bool>(
                      result: signup,
                    );
                    Get.snackbar(
                      signup ? 'Successful' : 'Failed',
                      signup
                          ? 'User created successfully'
                          : 'Something went wrong',
                    );
                  },
                  text: 'Sign Up',
                  child: controller.isLoading
                      ? const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
