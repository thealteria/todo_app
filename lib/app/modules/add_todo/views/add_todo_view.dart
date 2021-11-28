import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/modules/widgets/custom_app_bar.dart';
import 'package:todo_app/app/modules/widgets/custom_text_button.dart';
import 'package:todo_app/app/modules/widgets/custom_text_field_widget.dart';
import 'package:todo_app/app/modules/widgets/custom_timer_widget.dart';

import '../controllers/add_todo_controller.dart';

class AddTodoView extends GetView<AddTodoController> {
  const AddTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarWidget(
        title: Strings.addTodo,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: controller.formKey,
                    child: CustomTextFieldWidget(
                      validator: (v) {
                        if (v?.isEmpty == true) {
                          return Strings.fieldCantBeEmpty;
                        } else {
                          return null;
                        }
                      },
                      textSize: Dimens.fontSize18,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: AppColors.kPrimaryColor,
                          width: 2,
                        ),
                        borderRadius: 5.borderRadius,
                      ),
                      controller: controller.titleController,
                      labelText: Strings.title,
                    ),
                  ),
                  35.heightBox,
                  Text(
                    Strings.duration,
                    style: AppTextStyle.regularStyle.copyWith(
                      fontSize: Dimens.fontSize22,
                    ),
                  ),
                  15.heightBox,
                  SizedBox(
                    height: 180.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          alignment: Alignment.center,
                          height: 38.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(300),
                            borderRadius: 8.borderRadius,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Obx(
                                () => CustomTimerWidget(
                                  title: 'mins',
                                  selectedValue: controller.minute,
                                  onSelectedItemChanged:
                                      controller.onMinsSelection,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Obx(
                                () => CustomTimerWidget(
                                  title: 'secs',
                                  scrollController:
                                      controller.secsScrollController,
                                  selectedValue: controller.secs,
                                  onSelectedItemChanged:
                                      controller.onSecsSelection,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  20.heightBox,
                  CustomTextFieldWidget(
                    controller: controller.descriptionController,
                    labelText: Strings.description,
                    maxLines: null,
                    minLines: 5,
                    textSize: Dimens.fontSize18,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.kPrimaryColor,
                        width: 1,
                      ),
                      borderRadius: 5.borderRadius,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: CustomTextButton(
              title: Strings.save,
              onPressed: controller.onTodoSave,
            ),
          )
        ],
      ),
    );
  }
}
