import 'package:find_service/ultis/colors.dart';
import 'package:find_service/ultis/fonts.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, {Widget? leading, String? title}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leadingWidth: 50,
    leading: leading ??
        IconButton(
            splashRadius: 22,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.primary,
            )),
    centerTitle: true,
    title: Text(
      title ?? '',
      style: customSuperBig(context, color: AppColor.primary, bold: true),
    ),
  );
}
