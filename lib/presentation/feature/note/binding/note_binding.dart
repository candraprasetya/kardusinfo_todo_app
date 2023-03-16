import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/domain/usecase/create_note_usecase.dart';

import '../../../../domain/usecase/delete_note_usecase.dart';
import '../../../../domain/usecase/get_all_notes_usecase.dart';
import '../../../../domain/usecase/update_note_usecase.dart';
import '../controller/note_controller.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteController>(() => NoteController());

    // Usecases
    Get.lazyPut<GetAllNotesUseCase>(() => GetAllNotesUseCase(Get.find()));
    Get.lazyPut<CreateNoteUseCase>(() => CreateNoteUseCase(Get.find()));
    Get.lazyPut<UpdateNoteUseCase>(() => UpdateNoteUseCase(Get.find()));
    Get.lazyPut<DeleteNoteUseCase>(() => DeleteNoteUseCase(Get.find()));
  }
}
