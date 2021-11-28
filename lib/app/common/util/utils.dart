import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/common/values/styles/app_text_style.dart';

class Utils {
  const Utils._();

  static void showDialog(
    String? message, {
    String title = Strings.error,
    bool success = false,
    VoidCallback? onTap,
  }) =>
      Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: () async {
          Get.back();

          onTap?.call();

          return true;
        },
        title: success ? Strings.success : title,
        content: Text(
          message ?? Strings.somethingWentWrong,
          textAlign: TextAlign.center,
          maxLines: 6,
          style: AppTextStyle.semiBoldStyle.copyWith(
            color: AppColors.mineShaft,
            fontSize: Dimens.fontSize16,
          ),
        ),
        confirm: Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              Get.back();

              onTap?.call();
            },
            child: Text(
              Strings.ok,
              style: AppTextStyle.buttonTextStyle.copyWith(
                fontSize: Dimens.fontSize18,
              ),
            ),
          ),
        ),
      );

  static void timePicker(
    Function(int seconds) onSelectTime, {
    TimeOfDay? initialTime,
  }) {
    showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: Get.overlayContext!,
      initialTime: initialTime ??
          TimeOfDay.fromDateTime(
            DateTime.now(),
          ),
    ).then((v) {
      if (v != null) {
        final _duration = Duration(
          hours: v.hour,
          minutes: v.minute,
        );

        Get.printInfo(info: '_duration: ${_duration.toString()}');

        onSelectTime(_duration.inSeconds);
      }
    });
  }

  static void loadingDialog() {
    Utils.closeDialog();

    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      name: 'loadingDialog',
    );
  }

  static void closeDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  static void closeSnackbar() {
    if (Get.isSnackbarOpen == true) {
      Get.back();
    }
  }

  static void showSnackbar(String? message) {
    closeSnackbar();

    Get.rawSnackbar(message: message);
  }

  static void closeKeyboard() {
    final currentFocus = Get.focusScope!;
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
