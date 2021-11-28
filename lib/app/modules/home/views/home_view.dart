import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';
import 'package:todo_app/app/modules/widgets/custom_app_bar.dart';
import 'package:todo_app/app/modules/widgets/no_data_widget.dart';

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
      body: Obx(
        () {
          return controller.todosList.isEmpty
              ? const NoDataWidget()
              : ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: controller.todosList.length,
                  padding: EdgeInsets.all(16.w),
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
