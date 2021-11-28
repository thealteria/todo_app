import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app/common/util/exports.dart';

class CustomTimerWidget extends StatelessWidget {
  final ScrollController? scrollController;
  final String title;
  final int selectedValue;
  final ValueChanged<int>? onSelectedItemChanged;

  const CustomTimerWidget({
    Key? key,
    required this.title,
    this.onSelectedItemChanged,
    required this.selectedValue,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: ListWheelScrollView(
        controller: scrollController ??
            FixedExtentScrollController(
              initialItem:
                  title.contains('mins') ? selectedValue + 1 : selectedValue,
            ),
        onSelectedItemChanged: (i) =>
            onSelectedItemChanged?.call(title.contains('mins') ? i + 1 : i),
        itemExtent: 38.h,
        children: List.generate(
          title.contains('mins') ? 10 : 60,
          (i) {
            final data = title.contains('mins') ? i + 1 : i;
            return Container(
              alignment: title.contains('mins')
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                '$data $title',
                textAlign:
                    title.contains('mins') ? TextAlign.end : TextAlign.start,
                style: CupertinoTheme.of(context)
                    .textTheme
                    .pickerTextStyle
                    .copyWith(
                      fontSize: Dimens.fontSize20,
                      color:
                          selectedValue == data ? Colors.black : Colors.black38,
                    ),
                maxLines: 1,
                softWrap: false,
              ),
            );
          },
        ),
      ),
    );
    // CupertinoPicker(
    //   useMagnifier: true,
    //   magnification: 2.35 / 2.1,
    //   itemExtent: 32.h,
    //   onSelectedItemChanged: onSelectedItemChanged,
    //   children: List.generate(
    //     title.contains('mins') ? 10 : 60,
    //     (index) => Center(
    //       child: Text(
    //         '${index + 1} $title',
    //         style: TextStyle(
    //           fontSize: Dimens.fontSize18,
    //           fontWeight: FontWeight.w600,
    //         ),
    //         maxLines: 1,
    //         softWrap: false,
    //       ),
    //     ),
    //   ),
    //   // itemBuilder: (context, index) {
    //   //   return Center(
    //   //     child: Text(
    //   //       '${index + 1} $title',
    //   //       style: TextStyle(
    //   //         fontSize: Dimens.fontSize18,
    //   //         fontWeight: FontWeight.w600,
    //   //       ),
    //   //       maxLines: 1,
    //   //       softWrap: false,
    //   //     ),
    //   //   );
    //   // },
    // );
  }
}
