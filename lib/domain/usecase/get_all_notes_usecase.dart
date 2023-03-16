import 'package:kardusinfo_todo_app/core/helper/base_usecase.dart';

import '../../data/model/note_model.dart';
import '../repository/note_repository.dart';

class GetAllNotesUseCase extends UseCaseNoParams<List<NoteModel>> {
  final NoteRepository repository;
  GetAllNotesUseCase(this.repository);

  @override
  Future<List<NoteModel>> call() async {
    return await repository.getAllNotes();
  }
}
