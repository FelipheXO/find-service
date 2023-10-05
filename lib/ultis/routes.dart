import 'package:find_service/screens/forget_password/forget_password.dart';
import 'package:find_service/screens/home/home.dart';
import 'package:find_service/screens/new_service/new.dart';
import 'package:find_service/screens/profile/profile.dart';
import 'package:find_service/screens/sigin_In/sigin.dart';
import 'package:find_service/screens/sigin_up/sigin.dart';
import 'package:find_service/screens/splash/splash.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String siginIn = '/siginIn';
  static String forgetPassword = '/forgetPassword';
  static String siginUp = '/siginUp';
  static String home = '/home';
  static String profile = '/profile';
  static String newService = '/new-service';
  static String splash = '/splash';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: newService, page: () => const NewServiceScreen()),
    GetPage(name: siginIn, page: () => const SiginInScreen()),
    GetPage(name: siginUp, page: () => const SiginUpScreen()),
    GetPage(name: forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
  ];
}
