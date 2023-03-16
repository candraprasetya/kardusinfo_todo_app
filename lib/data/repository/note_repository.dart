import 'package:kardusinfo_todo_app/data/datasource/note_datasource.dart';
import 'package:kardusinfo_todo_app/data/model/note_model.dart';
import 'package:kardusinfo_todo_app/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDataSource ds;
  NoteRepositoryImpl(this.ds);

  @override
  Future<void> deleteNoteById(String id) {
    return ds.deleteNoteById(id);
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    var snapshot = await ds.noteCollection;
    return snapshot;
  }

  @override
  Future<NoteModel> getNoteById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> insertNote(NoteModel note) {
    return ds.addNewNote(note);
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    return await ds.updateNoteById(note);
  }
}
