import 'package:find_service/ultis/fonts.dart';
import 'package:find_service/components/forms/build_text_form.dart';
import 'package:flutter/material.dart';

class BuildNameForm extends StatelessWidget {
  const BuildNameForm({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: customBig(context, bold: true),
        ),
        BuildTextFormFild(
          hintText: 'Name',
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return 'Required name';
            }
            return null;
          },
        ),
      ],
    );
  }
}
