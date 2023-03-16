import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/core/util/app_color.dart';
import 'package:kardusinfo_todo_app/domain/usecase/create_note_usecase.dart';
import 'package:kardusinfo_todo_app/domain/usecase/update_note_usecase.dart';

import '../../../../data/model/note_model.dart';

class NoteCreateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController contentController;

  late CreateNoteUseCase createNoteUseCase;
  late UpdateNoteUseCase updateNoteUseCase;

  // pastel color list
  List<Color> palleteColors = [
    AppColor.pastelBlue,
    AppColor.pastelGreen,
    AppColor.pastelOrange,
    AppColor.pastelPink,
    AppColor.pastelPurple,
    AppColor.pastelYellow,
  ];

  // args
  var args = Get.arguments;

  // isUpdate -> bool
  final _isUpdate = false.obs;
  bool get isUpdate => _isUpdate.value;
  set isUpdate(bool value) => _isUpdate.value = value;

  // picked color
  final _pickedColor = AppColor.pastelBlue.obs;
  Color get pickedColor => _pickedColor.value;
  set pickedColor(Color value) => _pickedColor.value = value;

  // isLoading
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  // picked time
  final _pickedTime = DateTime.now().obs;
  DateTime? get pickedTime => _pickedTime.value;
  set pickedTime(DateTime? value) => _pickedTime.value = value!;

  @override
  void onInit() {
    createNoteUseCase = Get.find();
    updateNoteUseCase = Get.find();

    titleController = TextEditingController();
    contentController = TextEditingController();

    pickedColor = palleteColors[0];

    // if args not null, then set the title and content
    if (args != null) {
      args = Get.arguments[0];
      isUpdate = true;
      titleController.text = args!.title!;
      contentController.text = args!.content!;
      pickedColor = Color(args!.color!);
      pickedTime = args!.time;
    }

    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }

  // update note
  void updateNote() async {
    isLoading = true;
    try {
      // title and content still empty
      if (titleController.text.isEmpty && contentController.text.isEmpty) {
        Get.snackbar(
          'Empty Note',
          'Please fill the title and content',
          snackPosition: SnackPosition.TOP,
        );
        return;
      }
      await updateNoteUseCase.call(
        NoteModel(
          id: args!.id,
          title: titleController.text,
          content: contentController.text,
          time: pickedTime,
          color: pickedColor.value,
          isCompleted: false,
          dateCreated: args!.dateCreated,
          dateModified: DateTime.now(),
        ),
      );
      Get.back();
    } finally {
      isLoading = false;
    }
  }

  void createNote() async {
    isLoading = true;
    try {
      // title and content still empty
      if (titleController.text.isEmpty && contentController.text.isEmpty) {
        Get.snackbar(
          'Empty Note',
          'Please fill the title and content',
          snackPosition: SnackPosition.TOP,
        );
        return;
      }
      await createNoteUseCase.call(
        NoteModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: titleController.text,
          content: contentController.text,
          time: pickedTime,
          color: pickedColor.value,
          isCompleted: false,
          dateCreated: DateTime.now(),
          dateModified: DateTime.now(),
        ),
      );
      Get.back();
    } finally {
      isLoading = false;
    }
  }
}
