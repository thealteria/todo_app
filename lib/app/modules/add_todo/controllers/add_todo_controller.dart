import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/common/storage/storage.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/model/todo.dart';

class AddTodoController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final ScrollController secsScrollController = FixedExtentScrollController(
    initialItem: 0,
  );

  final RxInt _minute = 10.obs;
  int get minute => _minute.value;
  set minute(int v) => _minute.value = v;

  final RxInt _secs = 0.obs;
  int get secs => _secs.value;
  set secs(int v) => _secs.value = v;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    secsScrollController.dispose();

    super.dispose();
  }

  void onSecsSelection(int v) {
    if (minute == 10) {
      if (v == 0) return;

      secsScrollController.jumpTo(0);
      secs = 0;
      return;
    }

    secs = v;
    printInfo(info: 'secs: $v');
  }

  void onMinsSelection(int v) {
    minute = v;
    printInfo(info: 'mins: $v');

    if (v == 10) {
      secsScrollController.jumpTo(0);
      secs = 0;
    }
  }

  void onTodoSave() {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    formKey.currentState?.save();

    Utils.closeKeyboard();

    final duration = Duration(
      minutes: minute,
      seconds: secs,
    );

    final Todo todo = Todo(
      title: titleController.text,
      duration: duration.inSeconds,
      status: 1,
      description: descriptionController.text,
    );

    final list = Storage.todoList;
    list.add(todo);

    Storage.todoList = list;

    Get.back();
    Utils.showSnackbar(Strings.todoAddedSuccessfully);
  }
}
