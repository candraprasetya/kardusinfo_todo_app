import '../../core/helper/base_usecase.dart';
import '../../data/model/note_model.dart';
import '../repository/note_repository.dart';

class UpdateNoteUseCase extends UseCase<void, NoteModel> {
  final NoteRepository repository;
  UpdateNoteUseCase(this.repository);

  @override
  Future<void> call(NoteModel params) async {
    return await repository.updateNote(params);
  }
}
