import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextFieldController extends GetxController {
  late TextEditingController controller;

  AppTextFieldController({required this.controller});
}

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsecure;
  final String title;
  final bool isLongText;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isObsecure = false,
    this.title = '',
    this.isLongText = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppTextFieldController>(
      tag: GlobalKey().toString(),
      init: AppTextFieldController(controller: controller),
      initState: (_) {},
      builder: (_) {
        return Column(
          children: [
            // Title
            title == ''
                ? const SizedBox()
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: isLongText
                  ? TextField(
                      controller: _.controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hintText,
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          )),
                      obscureText: isObsecure,
                    )
                  : TextField(
                      controller: _.controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hintText,
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          )),
                      obscureText: isObsecure,
                    ),
            ),
          ],
        );
      },
    );
  }
}
