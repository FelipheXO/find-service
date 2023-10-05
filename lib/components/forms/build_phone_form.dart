import 'package:find_service/ultis/fonts.dart';
import 'package:find_service/components/forms/build_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildPhoneForm extends StatelessWidget {
  const BuildPhoneForm(
      {super.key, required this.controller, required this.number});
  final TextEditingController controller;
  final TextEditingController number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone',
          style: customBig(context, bold: true),
        ),
        Row(
          children: [
            BuildTextFormFild(
              width: MediaQuery.of(context).size.width * 0.2,
              hintText: 'Code',
              prefixIcon: Text(
                '+',
                style: customSuperBig(context),
              ),
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3)
              ],
              validator: (value) {
                if (value.isEmpty) {
                  return 'Required code';
                }
                return null;
              },
            ),
            const SizedBox(width: 20),
            Expanded(
              child: BuildTextFormFild(
                hintText: 'Number',
                controller: number,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Required number';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
