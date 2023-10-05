import 'package:find_service/components/custom_button.dart';
import 'package:find_service/controllers/users_controller.dart';
import 'package:find_service/ultis/colors.dart';
import 'package:find_service/ultis/fonts.dart';
import 'package:find_service/ultis/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (usersController) {
      return Drawer(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColor.primary,
                    child: Text(
                      usersController.users!.name![0].toUpperCase(),
                      style: customSuperBig(context, fontSize: 50),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá',
                        style: customBig(context),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          usersController.users!.name!.split(' ')[0],
                          style: customSuperBig(context, bold: true),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {},
                height: 50,
                color: AppColor.primary,
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.home, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        'Home',
                        style:
                            customBig(context, bold: true, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                radius: 8,
                buttonText: '',
              ),
              const SizedBox(height: 10),
              CustomButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.profile);
                },
                height: 50,
                color: AppColor.secudary,
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 10),
                      Text(
                        'Profile',
                        style: customBig(context, bold: true),
                      ),
                    ],
                  ),
                ),
                radius: 8,
                buttonText: '',
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  usersController.logout();
                },
                height: 40,
                color: AppColor.secudary,
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(Icons.logout),
                      const SizedBox(width: 10),
                      Text(
                        'Log-out',
                        style: customMedium(context, bold: true),
                      ),
                    ],
                  ),
                ),
                radius: 8,
                buttonText: '',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ));
    });
  }
}
