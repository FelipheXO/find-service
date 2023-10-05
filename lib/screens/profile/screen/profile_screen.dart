// ignore_for_file: use_build_context_synchronously

part of '../profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController code = TextEditingController();
  final TextEditingController number = TextEditingController();
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    Users? user = Get.find<UsersController>().users;
    if (user != null) {
      name.text = user.name ?? '';
      email.text = user.email ?? '';
      city.text = user.city ?? '';
      state.text = user.state ?? '';
      code.text = user.code ?? '';
      number.text = user.number ?? '';
      setState(() {});
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (usersController) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppBar(context, title: 'Profile'),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: AppColor.primary,
                    child: Text(
                      'F',
                      style: customSuperBig(context, fontSize: 50),
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
                        const SizedBox(height: 20),
                        CustomButton(
                            isLoading: usersController.isLoading,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await usersController.editUser(Users(
                                    email: email.text,
                                    name: name.text,
                                    city: city.text,
                                    code: code.text,
                                    state: state.text,
                                    number: number.text));
                                Navigator.pop(context);
                              }
                            },
                            buttonText: 'Update'),
                        const SizedBox(height: 15),
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
