import 'package:find_service/ultis/assets.dart';
import 'package:find_service/ultis/colors.dart';
import 'package:find_service/ultis/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildHeaderLogo extends StatelessWidget {
  const BuildHeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        height: 170,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          color: AppColor.secudary,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logo,
                width: 170,
              ),
              Text(
                'Find Service',
                style: customSuperBig(context, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
