import 'package:find_service/ultis/colors.dart';
import 'package:find_service/ultis/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ultis/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find Service',
      theme: ThemeData(
        expansionTileTheme: const ExpansionTileThemeData(
            iconColor: AppColor.primary, textColor: AppColor.primary),
        textTheme: GoogleFonts.openSansTextTheme(),
        hoverColor: AppColor.primary,
        iconTheme: const IconThemeData(
          color: AppColor.primary,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColor.primary,
          ),
        ),
        primaryIconTheme: const IconThemeData(
          color: AppColor.primary,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColor.primary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(
            color: AppColor.primary,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primary,
            ),
          ),
        ),
      ),
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
      navigatorKey: Get.key,
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
