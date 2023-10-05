part of '../sigin.dart';

class SiginUpScreen extends StatefulWidget {
  const SiginUpScreen({super.key});

  @override
  State<SiginUpScreen> createState() => _SiginUpScreenState();
}

class _SiginUpScreenState extends State<SiginUpScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController code = TextEditingController();
  final TextEditingController number = TextEditingController();
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
                      'Sign-up',
                      style: customSuperBig(context, fontSize: 30, bold: true),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        BuildNameForm(controller: name),
                        const SizedBox(height: 10),
                        BuildEmailForm(controller: email),
                        const SizedBox(height: 10),
                        BuildPhoneForm(controller: code, number: number),
                        const SizedBox(height: 10),
                        BuildCityForm(controller: city),
                        const SizedBox(height: 10),
                        BuildStateForm(controller: state),
                        const SizedBox(height: 20),
                        const Divider(),
                        const SizedBox(height: 10),
                        BuildPasswordForm(
                          controller: password,
                          obscure: obscure,
                          onTap: () {
                            obscure = !obscure;
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 10),
                        BuildPasswordForm(
                          text: 'Repeat-password',
                          controller: rePassword,
                          obscure: obscure,
                          onTap: () {
                            obscure = !obscure;
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                            isLoading: usersController.isLoading,
                            onPressed: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_formKey.currentState!.validate()) {
                                usersController.siginUp(
                                    context,
                                    Users(
                                        name: name.text,
                                        email: email.text,
                                        code: code.text,
                                        number: number.text,
                                        city: city.text,
                                        state: state.text,
                                        password: password.text));
                              }
                            },
                            buttonText: 'Sign-up'),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Have a account ? ",
                                style: customBig(context, color: AppColor.grey),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(AppRoutes.siginIn);
                                  },
                                text: "Sign-in",
                                style: customBig(context,
                                    color: AppColor.grey, bold: true),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
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
