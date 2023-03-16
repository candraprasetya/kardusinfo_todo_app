import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/core/helper/auth_helper.dart';
import 'package:kardusinfo_todo_app/core/router/route_name.dart';
import 'package:kardusinfo_todo_app/data/model/note_model.dart';
import 'package:kardusinfo_todo_app/domain/usecase/create_note_usecase.dart';
import 'package:kardusinfo_todo_app/domain/usecase/get_all_notes_usecase.dart';
import 'package:kardusinfo_todo_app/domain/usecase/update_note_usecase.dart';

import '../../../../domain/usecase/delete_note_usecase.dart';

class NoteController extends GetxController {
  late AuthHelper _authHelper;
  late GetAllNotesUseCase _getAllNotesUseCase;
  late CreateNoteUseCase _createNoteUseCase;
  late UpdateNoteUseCase _updateNoteUseCase;
  late DeleteNoteUseCase _deleteNoteUseCase;

  final _userEmail = ''.obs;
  String get userEmail => _userEmail.value;
  set userEmail(String value) => _userEmail.value = value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  // today reminder
  final _todayReminder = <NoteModel>[].obs;
  List<NoteModel> get todayReminder => _todayReminder;
  set todayReminder(List<NoteModel> value) => _todayReminder.value = value;

  // all reminder
  final _allReminder = <NoteModel>[].obs;
  List<NoteModel> get allReminder => _allReminder;
  set allReminder(List<NoteModel> value) => _allReminder.value = value;

  @override
  void onInit() async {
    _authHelper = AuthHelper();
    _getAllNotesUseCase = Get.find();
    _createNoteUseCase = Get.find();
    _updateNoteUseCase = Get.find();
    _deleteNoteUseCase = Get.find();
    isLoading = true;
    try {
      getUser();
      await getAllNotes();
    } finally {
      isLoading = false;
    }
    super.onInit();
  }

  void getUser() {
    var user = _authHelper.getUser();
    userEmail = user!.email!;
  }

  Future<void> getAllNotes() async {
    isLoading = true;
    try {
      var notes = await _getAllNotesUseCase.call();
      todayReminder = notes
          .where((element) =>
              DateTime.now().day == element.time?.day &&
              DateTime.now().month == element.time?.month &&
              DateTime.now().year == element.time?.year)
          .toList();
      allReminder = notes;
    } finally {
      isLoading = false;
    }
  }

  // Delete todo
  Future<void> deleteNoteById(NoteModel note) async {
    isLoading = true;
    try {
      await _deleteNoteUseCase.call(note);
      await getAllNotes();
    } finally {
      isLoading = false;
    }
  }

  // complete todo
  Future<void> completeNote(NoteModel note) async {
    isLoading = true;
    try {
      await _updateNoteUseCase.call(note);
      await getAllNotes();
    } finally {
      isLoading = false;
    }
  }

  // logout
  Future<void> logout() async {
    isLoading = true;
    try {
      await _authHelper.signOutUser();
      Get.offAllNamed(RouteName.login);
    } finally {
      isLoading = false;
    }
  }
}
