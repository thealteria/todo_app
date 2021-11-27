import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Strings.appName),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onAddTodo,
      ),
      body: Obx(
        () {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: controller.todosList.length,
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final dynamic _data = controller.todosList[index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${_data['title'].toString()}',
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Body: ${_data['body'].toString()}',
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
