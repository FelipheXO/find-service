import 'package:find_service/ultis/colors.dart';
import 'package:find_service/ultis/fonts.dart';
import 'package:find_service/components/forms/build_text_form.dart';
import 'package:flutter/material.dart';

class BuildPasswordForm extends StatelessWidget {
  const BuildPasswordForm(
      {super.key,
      required this.controller,
      this.controller2,
      required this.obscure,
      this.text,
      required this.onTap});
  final TextEditingController controller;
  final TextEditingController? controller2;
  final bool obscure;
  final VoidCallback onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? 'Password',
          style: customBig(context, bold: true),
        ),
        BuildTextFormFild(
          hintText: 'Password',
          controller: controller,
          obscure: obscure,
          validator: (value) {
            if (value.isEmpty || value.toString().length < 5) {
              return 'Enter password at least 6 characters long';
            } else if (controller2 != null && value != controller2!.text) {
              return 'Different password';
            }
            return null;
          },
          suffixIcon: IconButton(
              onPressed: onTap,
              icon: !obscure
                  ? const Icon(
                      Icons.visibility,
                      color: AppColor.primary,
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: AppColor.primary,
                    )),
        ),
      ],
    );
  }
}
