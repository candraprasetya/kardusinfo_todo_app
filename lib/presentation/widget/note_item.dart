import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kardusinfo_todo_app/core/router/route_name.dart';
import 'package:kardusinfo_todo_app/core/util/app_color.dart';
import 'package:kardusinfo_todo_app/core/util/app_global_function.dart';
import 'package:kardusinfo_todo_app/presentation/feature/note/controller/note_controller.dart';
import '../../data/model/note_model.dart';

class NoteItem extends StatelessWidget {
  final NoteModel data;
  const NoteItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Get.toNamed(RouteName.noteCreate, arguments: [data]);
        Get.find<NoteController>().getAllNotes();
      },
      child: Container(
        padding: const EdgeInsets.only(right: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        clipBehavior: Clip.none,
        child: Row(
          children: [
            // color
            Container(
              height: 60,
              width: 8,
              decoration: BoxDecoration(
                color: data.isCompleted!
                    ? AppColor.pastelGrey.withOpacity(.5)
                    : Color(data.color!),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
            ),

            // isCompleted
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {
                var newData = NoteModel(
                  id: data.id,
                  title: data.title,
                  content: data.content,
                  time: data.time,
                  color: data.color,
                  dateCreated: data.dateCreated,
                  dateModified: data.dateModified,
                  isCompleted: !data.isCompleted!,
                );
                Get.find<NoteController>().completeNote(newData);
              },
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: data.isCompleted! ? AppColor.pastelGrey : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.pastelGrey.withOpacity(.5),
                    width: 1,
                  ),
                ),
                child: data.isCompleted!
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 14,
                      )
                    : Container(),
              ),
            ),

            // Title and Date Created / modified
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      data.title!,
                      style: TextStyle(
                        fontSize: 16,
                        decoration: data.isCompleted!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: data.isCompleted!
                            ? AppColor.pastelGrey
                            : AppColor.pastelBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    // Date Created
                    Text(
                      "Reminder for : ${formatDate(data.time!)}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),

            // delete icon
            GestureDetector(
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    title: const Text("Delete Note"),
                    content:
                        const Text("Are you sure want to delete this note?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.find<NoteController>().deleteNoteById(data);
                          Get.back();
                        },
                        child: const Text("Delete"),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColor.pastelGrey.withOpacity(.5),
                    width: 1,
                  ),
                ),
                child: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
