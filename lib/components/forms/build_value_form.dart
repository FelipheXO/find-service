import 'package:brasil_fields/brasil_fields.dart';
import 'package:find_service/ultis/fonts.dart';
import 'package:find_service/components/forms/build_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildValueForm extends StatelessWidget {
  const BuildValueForm({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Value',
          style: customBig(context, bold: true),
        ),
        BuildTextFormFild(
          hintText: 'Value',
          controller: controller,
          keyboardType: TextInputType.number,
          prefixIcon: Text(
            '\$ ',
            style: customSuperBig(context, bold: true),
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CentavosInputFormatter(moeda: false),
          ],
          validator: (value) {
            if (value.isEmpty) {
              return 'Required value';
            }
            return null;
          },
        ),
      ],
    );
  }
}
