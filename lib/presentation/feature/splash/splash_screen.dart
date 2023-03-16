import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/presentation/feature/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        initState: (_) {},
        builder: (_) {
          return const Center(
            child: Hero(
              tag: 'applogo',
              child: Text('Todo App'),
            ),
          );
        },
      ),
    );
  }
}
