import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/app/common/util/exports.dart';

class Extensions {}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(this.r);

  SizedBox get heightBox => SizedBox(
        height: this.h,
      );

  SizedBox get widthBox => SizedBox(
        width: this.w,
      );
}

extension DateTimeFormatterExt on DateTime {
  String formatedDate({
    String dateFormat = 'yyyy-MM-dd',
  }) {
    final formatter = DateFormat(dateFormat);
    return formatter.format(this);
  }
}

extension FormatDurationExt on int {
  ///convert seconds into string "00:00:00"

  String formatDuration() {
    //this -> always in seconds
    final duration = Duration(seconds: this.round());

    return [
      if (duration.inHours != 0) duration.inHours,
      duration.inMinutes,
      duration.inSeconds,
    ].map((seg) => seg.remainder(60).toString().padLeft(2, '0')).join(':');

    // final min = this ~/ 60;
    // final sec = this % 60;
    // return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")} mins";
  }
}
