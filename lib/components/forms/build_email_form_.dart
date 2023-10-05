import 'package:find_service/ultis/fonts.dart';
import 'package:find_service/components/forms/build_text_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildEmailForm extends StatelessWidget {
  const BuildEmailForm({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'E-mail',
          style: customBig(context, bold: true),
        ),
        BuildTextFormFild(
          hintText: 'e-mail',
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return 'Required e-mail';
            } else if (!GetUtils.isEmail(value.replaceAll(' ', ''))) {
              return 'Invalid e-mail';
            }
            return null;
          },
        ),
      ],
    );
  }
}
