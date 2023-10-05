import 'package:find_service/ultis/fonts.dart';
import 'package:find_service/components/forms/build_text_form.dart';
import 'package:flutter/material.dart';

class BuildDescriptionForm extends StatelessWidget {
  const BuildDescriptionForm({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: customBig(context, bold: true),
        ),
        BuildTextFormFild(
          hintText: 'Description',
          controller: controller,
          expanded: true,
          maxLines: 2,
          validator: (value) {
            if (value.isEmpty) {
              return 'Required description';
            }
            return null;
          },
        ),
      ],
    );
  }
}
