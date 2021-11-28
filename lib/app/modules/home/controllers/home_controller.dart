import 'dart:async';

import 'package:get/get.dart';
import 'package:todo_app/app/common/constants.dart';
import 'package:todo_app/app/common/storage/storage.dart';
import 'package:todo_app/app/model/todo.dart';
import 'package:todo_app/app/routes/app_pages.dart';

class HomeController extends GetxController {
  List<Todo> todosList = <Todo>[];

  Timer? _timer;

  @override
  void onReady() {
    super.onReady();

    todosList = Storage.todoList;
    _startTimer();

    Storage.storage.listenKey(Constants.todosList, (value) {
      todosList = value;

      _timer?.cancel();
      _startTimer();
      update();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();

    super.onClose();
  }

  void onAddTodo() {
    Storage.todoList = todosList;
    Get.toNamed(Routes.ADD_TODO);
  }

  void _startTimer() {
    if (todosList.isEmpty) return;

    const oneSec = Duration(seconds: 1);

    _timer ??= Timer.periodic(
      oneSec,
      (t) {
        if (todosList.every((e) => e.duration == 0)) {
          _timer?.cancel();
          t.cancel();
        } else {
          for (int i = 0; i < todosList.length; i++) {
            final t = todosList[i];
            if (t.duration != null) {
              if (t.duration! > 0) {
                if (t.status == 1) {
                  t.duration = t.duration! - 1;
                }
              } else {
                t.status = 0;
              }

              updateList(t, i);
            }
          }

          update();
        }
      },
    );
  }

  void onTodoStatusChange(Todo t, int index) {
    printInfo(info: 'todo: ${t.toJson()}');

    if (t.status == 1) {
      t.status = 2;
    } else {
      t.status = 1;
    }

    updateList(t, index);
    update();
  }

  updateList(Todo t, int index) {
    todosList[index] = t;
    Storage.todoList = todosList;

    printInfo(info: 'list: ${Storage.todoList}');
  }
}
