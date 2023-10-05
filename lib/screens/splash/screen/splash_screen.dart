part of '../splash.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _route();
    super.initState();
  }

  void _route() {
    Timer(const Duration(seconds: 2), () async {
      final controller = Get.find<UsersController>();
      await controller.getUser();
      if (controller.users != null) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.siginIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            const SizedBox(height: 10),
            const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColor.primary))),
          ],
        ),
      ),
    );
  }
}
