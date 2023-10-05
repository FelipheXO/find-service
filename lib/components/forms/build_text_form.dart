import 'package:find_service/ultis/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class BuildTextFormFild extends StatelessWidget {
  TextEditingController? controller;
  final String? label;
  final Color? fontColor;
  final Color? textStyle;
  final double? fontSize;
  final String? fontFamily;
  final String? cursorColor;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator? validator;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  bool? obscure = false;
  bool? grey = false;
  bool? expanded = false;
  String? initialValue;
  bool? enabled;
  final double? width;

  BuildTextFormFild(
      {Key? key,
      this.label,
      this.enabled,
      this.width,
      this.initialValue,
      this.expanded,
      this.grey,
      this.controller,
      this.inputFormatters,
      this.keyboardType,
      this.onChanged,
      this.textAlign,
      this.fontColor,
      this.textStyle,
      this.fontSize,
      this.fontFamily,
      this.cursorColor,
      this.hintText,
      this.maxLength,
      this.maxLines,
      this.validator,
      this.obscure,
      this.suffixIcon,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: TextFormField(
          textAlign: textAlign ?? TextAlign.start,
          enabled: enabled,
          textAlignVertical: TextAlignVertical.center,
          initialValue: initialValue,
          keyboardType: keyboardType,
          obscureText: obscure == null || obscure == false ? false : true,
          validator: validator,
          inputFormatters: inputFormatters,
          controller: controller,
          style: TextStyle(
            color: fontColor,
            fontSize: fontSize ?? 22,
          ),
          onChanged: onChanged,
          maxLength: maxLength,
          maxLines: expanded == true ? null : maxLines ?? 1,
          decoration: InputDecoration(
              prefix: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hintText ?? label ?? '',
              hintStyle: customBig(context)),
        ),
      ),
    );
  }
}
