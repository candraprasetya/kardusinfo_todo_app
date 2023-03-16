import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/core/helper/auth_helper.dart';
import 'package:kardusinfo_todo_app/core/helper/firestore_helper.dart';
import 'package:kardusinfo_todo_app/domain/repository/note_repository.dart';

import '../../data/datasource/note_datasource.dart';
import '../../data/repository/note_repository.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Helpers
    Get.lazyPut(() => AuthHelper(), fenix: true);
    Get.lazyPut(() => FirestoreHelper(), fenix: true);

    // Datasources
    Get.lazyPut(() => NoteDataSource(Get.find()), fenix: true);

    // Repositories
    Get.lazyPut<NoteRepository>(() => NoteRepositoryImpl(Get.find()),
        fenix: true);
  }
}
