// ignore_for_file: use_build_context_synchronously

part of '../new.dart';

class NewServiceScreen extends StatefulWidget {
  const NewServiceScreen({super.key});

  @override
  State<NewServiceScreen> createState() => _NewServiceScreenState();
}

class _NewServiceScreenState extends State<NewServiceScreen> {
  final TextEditingController title = TextEditingController();
  final TextEditingController sub = TextEditingController();
  final TextEditingController value = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(builder: (usersController) {
      return GetBuilder<ServicesController>(builder: (servicesController) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: customAppBar(context, title: 'New Service'),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          BuildNameForm(controller: title),
                          const SizedBox(height: 10),
                          BuildDescriptionForm(controller: sub),
                          const SizedBox(height: 10),
                          BuildValueForm(controller: value),
                          const SizedBox(height: 20),
                          const SizedBox(height: 20),
                          CustomButton(
                              isLoading: servicesController.isLoading,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await servicesController.create(Services(
                                      name: usersController.users!.name,
                                      email: usersController.users!.email,
                                      number: usersController.users!.number,
                                      code: usersController.users!.code,
                                      userId: usersController.users!.id,
                                      city: usersController.users!.city,
                                      state: usersController.users!.state,
                                      title: title.text,
                                      createdAt:
                                          DateTime.now().millisecondsSinceEpoch,
                                      des: sub.text,
                                      value: value.text));
                                  Navigator.pushReplacementNamed(
                                      context, AppRoutes.home);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      backgroundColor: Colors.green,
                                      content: Text(
                                        'Added service',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  );
                                }
                              },
                              buttonText: 'Add Service'),
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
    });
  }
}
