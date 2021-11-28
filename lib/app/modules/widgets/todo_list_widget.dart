import 'package:flutter/material.dart';
import 'package:todo_app/app/common/util/exports.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';

class TodoListWidget extends StatelessWidget {
  final HomeController c;
  const TodoListWidget({
    Key? key,
    required this.c,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
          isThreeLine: _data.description != null &&
              _data.description?.isNotEmpty == true,
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _data.status == 0
                    ? Strings.statusDone
                    : '${Strings.remainingDuration}'
                        ': ${_data.duration?.formatDuration()}',
                style: AppTextStyle.regularStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (_data.description != null &&
                  _data.description?.isNotEmpty == true) ...[
                5.heightBox,
                Text(
                  _data.description ?? '',
                  style: AppTextStyle.regularStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
          trailing: IconButton(
            onPressed: () => c.onTodoStatusChange(
              _data,
              index,
            ),
            icon: _data.status == 0
                ? const SizedBox.shrink()
                : Icon(
                    _data.status == 1 ? Icons.pause : Icons.play_arrow,
                  ),
          ),
        );
      },
    );
  }
}
