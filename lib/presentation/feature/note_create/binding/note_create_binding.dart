import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/domain/usecase/update_note_usecase.dart';

import '../controller/note_create_controller.dart';

class NoteCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteCreateController>(() => NoteCreateController());

    Get.lazyPut<UpdateNoteUseCase>(() => UpdateNoteUseCase(Get.find()));
  }
}
