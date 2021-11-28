import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';
import 'package:todo_app/app/modules/widgets/custom_app_bar.dart';
import 'package:todo_app/app/modules/widgets/no_data_widget.dart';
import 'package:todo_app/app/modules/widgets/todo_list_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWidget(
        title: Strings.appName,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onAddTodo,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (c) {
          return c.todosList.isEmpty
              ? const NoDataWidget()
              : TodoListWidget(c: c);
        },
      ),
    );
  }
}
