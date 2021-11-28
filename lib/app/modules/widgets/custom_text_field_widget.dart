import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/app/common/util/exports.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String? labelText, hintText;
  final String? initialValue;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String?>? onChanged, onSaved;
  final int? maxLength, maxLines;
  final int minLines;
  final bool readOnly, addHint, enabled;
  final InputBorder? border;
  final EdgeInsets? prefixIconPadding;
  final Color? fillColor;
  final double? textSize;
  final FormFieldValidator<String?>? validator;

  const CustomTextFieldWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.maxLength,
    this.maxLines,
    this.minLines = 1,
    this.initialValue,
    this.readOnly = false,
    this.border,
    this.enabled = true,
    this.addHint = false,
    this.prefixIconPadding,
    this.fillColor,
    this.textSize,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      initialValue: initialValue,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      minLines: minLines,
      maxLines: maxLines,
      onSaved: onSaved,
      enabled: enabled,
      validator: validator,
      textCapitalization: TextCapitalization.sentences,
      inputFormatters: maxLength == null
          ? null
          : [
              LengthLimitingTextInputFormatter(maxLength),
              if (keyboardType == TextInputType.number)
                FilteringTextInputFormatter.digitsOnly,
            ],
      style: AppTextStyle.regularStyle.copyWith(
        fontSize: textSize ?? Dimens.fontSize22,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        fillColor: fillColor,
        filled: fillColor != null,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        labelText: addHint
            ? null
            : ((controller?.text != null || !readOnly) ? labelText : null),
        hintText: hintText,
      ),
    );
  }
}
