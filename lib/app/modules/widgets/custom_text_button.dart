import 'package:flutter/material.dart';
import 'package:todo_app/app/common/util/exports.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final double height;
  final double? buttonWidth, textFontSize;
  final Widget? child;
  final Color buttonColor;
  final bool addBorder;

  const CustomTextButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.height = 52,
    this.child,
    this.buttonColor = AppColors.kPrimaryColor,
    this.buttonWidth,
    this.textFontSize,
    this.addBorder = false,
  })  : assert(
          title == null || child == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "child: Text(title)".',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith(
          (_) => EdgeInsets.zero,
        ),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => buttonWidth == null
              ? Size.fromHeight(height.h)
              : Size(
                  buttonWidth!,
                  height.h,
                ),
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return buttonColor == Colors.transparent ||
                      buttonColor == Colors.white
                  ? AppColors.kPrimaryColor.withOpacity(.24)
                  : AppColors.white.withOpacity(.14);
            }

            return null;
          },
        ),
        shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
          (states) => RoundedRectangleBorder(
            borderRadius: 8.borderRadius,
            side: addBorder
                ? BorderSide(
                    color: buttonColor == AppColors.kPrimaryColor
                        ? Colors.white
                        : AppColors.kPrimaryColor,
                    width: 2.w,
                  )
                : BorderSide.none,
          ),
        ),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
          (_) => AppTextStyle.buttonTextStyle.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.doveGray;
            }

            return buttonColor;
          },
        ),
      ),
      child: child ??
          Text(
            title!,
            style: AppTextStyle.buttonTextStyle.copyWith(
              fontSize: textFontSize ?? Dimens.fontSize16,
              color: buttonColor == Colors.white ||
                      buttonColor == Colors.transparent
                  ? AppColors.kPrimaryColor
                  : Colors.white,
            ),
          ),
    );
  }
}
