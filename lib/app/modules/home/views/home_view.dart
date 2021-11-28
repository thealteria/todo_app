import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/common/values/app_colors.dart';
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
      body: GetBuilder<HomeController>(
        builder: (c) {
          return c.todosList.isEmpty
              ? const NoDataWidget()
              : ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: c.todosList.length,
                  padding: EdgeInsets.all(16.w),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final _data = c.todosList[index];

                    return ListTile(
                      minLeadingWidth: 20.w,
                      leading: Container(
                        height: 10.w,
                        width: 10.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _data.status == 1
                              ? Colors.green
                              : (_data.status == 2 ? Colors.grey : Colors.red),
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderRadius: 10.borderRadius,
                        borderSide: const BorderSide(
                          color: AppColors.doveGray,
                        ),
                      ),
                      title: Text(
                        '${_data.title}',
                        style: AppTextStyle.boldStyle,
                      ),
                      subtitle: Text(
                        _data.status == 0
                            ? Strings.statusDone
                            : '${Strings.remainingDuration}'
                                ': ${_data.duration?.formatDuration()}',
                        style: AppTextStyle.regularStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: IconButton(
                        onPressed: () => controller.onTodoStatusChange(
                          _data,
                          index,
                        ),
                        icon: _data.status == 0
                            ? const SizedBox.shrink()
                            : Icon(
                                _data.status == 1
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
