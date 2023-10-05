part of '../sigin.dart';

class SiginInScreen extends StatefulWidget {
  const SiginInScreen({super.key});

  @override
  State<SiginInScreen> createState() => _SiginInScreenState();
}

class _SiginInScreenState extends State<SiginInScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (usersController) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BuildHeaderLogo(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Sign-in',
                      style: customSuperBig(context, fontSize: 30, bold: true),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        BuildEmailForm(controller: email),
                        const SizedBox(height: 15),
                        BuildPasswordForm(
                          controller: password,
                          obscure: obscure,
                          onTap: () {
                            obscure = !obscure;
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 5),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.forgetPassword);
                          },
                          child: Text(
                            'Forget password?',
                            style: customMedium(context, bold: true),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        CustomButton(
                            isLoading: usersController.isLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                usersController.siginIn(
                                    context, email.text, password.text);
                              }
                            },
                            buttonText: 'Sign-in'),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Don't have a account ? ",
                                style: customMedium(context,
                                    color: AppColor.grey, fontSize: 16),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(AppRoutes.siginUp);
                                  },
                                text: "Sign-up",
                                style: customMedium(context,
                                    color: AppColor.grey,
                                    bold: true,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
