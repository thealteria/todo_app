import 'package:flutter/material.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class TodoGridWidget extends StatelessWidget {
  final HomeController c;
  const TodoGridWidget({
    Key? key,
    required this.c,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.w),
      itemCount: c.todosList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (_, i) {
        final _data = c.todosList[i];

        return Container(
          decoration: BoxDecoration(
            borderRadius: 10.borderRadius,
            border: Border.all(
              color: AppColors.doveGray,
            ),
          ),
          padding: EdgeInsets.all(8.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _data.status == 1
                                ? Colors.green
                                : (_data.status == 2
                                    ? Colors.grey
                                    : Colors.red),
                          ),
                        ),
                        10.widthBox,
                        Expanded(
                          child: Text(
                            _data.title ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.boldStyle,
                          ),
                        ),
                      ],
                    ),
                    10.heightBox,
                    Text(
                      _data.status == 0
                          ? Strings.statusDone
                          : '${Strings.remainingDuration}'
                              ': ${_data.duration?.formatDuration()}',
                      style: AppTextStyle.regularStyle,
                      maxLines: 3,
                    ),
                    if (_data.description != null &&
                        _data.description?.isNotEmpty == true) ...[
                      5.heightBox,
                      Expanded(
                        child: Text(
                          _data.description ?? '',
                          style: AppTextStyle.regularStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              IconButton(
                onPressed: () => c.onTodoStatusChange(
                  _data,
                  i,
                ),
                icon: _data.status == 0
                    ? const SizedBox.shrink()
                    : Icon(
                        _data.status == 1 ? Icons.pause : Icons.play_arrow,
                      ),
              ),
            ],
          ),
        );
      },
    );
    // ListView.separated(
    //   separatorBuilder: (context, index) => SizedBox(height: 10.h),
    //   itemCount: c.todosList.length,
    //   padding: EdgeInsets.all(16.w),
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) {
    //     final _data = c.todosList[index];

    //     return ListTile(
    //       minLeadingWidth: 20.w,
    //       leading: Container(
    //         height: 10.w,
    //         width: 10.w,
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: _data.status == 1
    //               ? Colors.green
    //               : (_data.status == 2 ? Colors.grey : Colors.red),
    //         ),
    //       ),
    //       shape: OutlineInputBorder(
    //         borderRadius: 10.borderRadius,
    //         borderSide: const BorderSide(
    //           color: AppColors.doveGray,
    //         ),
    //       ),
    //       title: Text(
    //         '${_data.title} grid',
    //         style: AppTextStyle.boldStyle,
    //       ),
    //       isThreeLine: _data.description != null &&
    //           _data.description?.isNotEmpty == true,
    //       subtitle: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             _data.status == 0
    //                 ? Strings.statusDone
    //                 : '${Strings.remainingDuration}'
    //                     ': ${_data.duration?.formatDuration()}',
    //             style: AppTextStyle.regularStyle,
    //             maxLines: 2,
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //           if (_data.description != null &&
    //               _data.description?.isNotEmpty == true) ...[
    //             5.heightBox,
    //             Text(
    //               _data.description ?? '',
    //               style: AppTextStyle.regularStyle,
    //               maxLines: 2,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ],
    //         ],
    //       ),
    //       trailing: IconButton(
    //         onPressed: () => c.onTodoStatusChange(
    //           _data,
    //           index,
    //         ),
    //         icon: _data.status == 0
    //             ? const SizedBox.shrink()
    //             : Icon(
    //                 _data.status == 1 ? Icons.pause : Icons.play_arrow,
    //               ),
    //       ),
    //     );
    //   },
    // );
  }
}
