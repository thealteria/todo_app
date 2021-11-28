import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/common/util/exports.dart';

class CustomAppbarWidget extends PreferredSize {
  final String title;

  const CustomAppbarWidget({
    Key? key,
    required this.title,
  }) : super(
          key: key,
          child: const SizedBox.shrink(),
          preferredSize: const Size.fromHeight(kToolbarHeight),
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      leading: title == Strings.appName
          ? null
          : IconButton(
              color: AppColors.black,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.black,
              ),
            ),
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: AppTextStyle.semiBoldStyle.copyWith(
          fontSize: Dimens.fontSize32,
        ),
      ),
    );
  }
}
