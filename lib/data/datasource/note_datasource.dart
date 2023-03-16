import 'package:kardusinfo_todo_app/core/helper/firestore_helper.dart';
import 'package:kardusinfo_todo_app/data/model/note_model.dart';

class NoteDataSource {
  final FirestoreHelper firebaseHelper;
  NoteDataSource(this.firebaseHelper);

  // get note collection
  Future<List<NoteModel>> get noteCollection async {
    var ref = await firebaseHelper.getCollection('notes').get();
    var listModel = ref.docs.map((e) {
      var data = e.data() as Map<String, dynamic>;
      return NoteModel.fromJson(data);
    }).toList();
    return listModel;
  }

  // get note by id
  Future<NoteModel> getNoteById(String id) async {
    var ref = await firebaseHelper.getDocumentById('notes', id);
    var data = ref.data() as Map<String, dynamic>;
    return NoteModel.fromJson(data);
  }

  // add new note
  Future<void> addNewNote(NoteModel note) async {
    await firebaseHelper.addDocumentById('notes', note.id!, note.toJson());
  }

  // update note by id
  Future<void> updateNoteById(NoteModel note) async {
    await firebaseHelper.updateDocumentById('notes', note.id!, note.toJson());
  }

  // delete note by id
  Future<void> deleteNoteById(String id) async {
    await firebaseHelper.deleteDocumentById('notes', id);
  }
}
