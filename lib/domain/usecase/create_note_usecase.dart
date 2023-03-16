import 'package:kardusinfo_todo_app/core/helper/base_usecase.dart';
import 'package:kardusinfo_todo_app/data/model/note_model.dart';

import '../repository/note_repository.dart';

class CreateNoteUseCase extends UseCase<void, NoteModel> {
  final NoteRepository repository;
  CreateNoteUseCase(this.repository);

  @override
  Future<void> call(NoteModel params) async {
    return await repository.insertNote(params);
  }
}
