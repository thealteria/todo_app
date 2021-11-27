import 'package:flutter/material.dart';
import 'package:todo_app/app/common/util/exports.dart';

class NoDataWidget extends StatelessWidget {
  final String? message;

  const NoDataWidget({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? Strings.noDataAvailable,
        style: AppTextStyle.semiBoldStyle,
      ),
    );
  }
}
