import 'package:find_service/controllers/services_controller.dart';
import 'package:find_service/controllers/users_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => UsersController());
  Get.lazyPut(() => ServicesController());
}
