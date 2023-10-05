part of '../home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Services> services = [];

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    services = await Get.find<ServicesController>().get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const BuildDrawer(),
      backgroundColor: Colors.white,
      appBar: customAppBar(context,
          leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                AppAssets.menu,
              ),
            ),
          ),
          title: 'Services'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 8),
            CustomButton(
                height: 40,
                onPressed: () {
                  Get.toNamed(AppRoutes.newService);
                },
                buttonText: 'Add Service'),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: services.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        _BuildCard(
                          services: services[index],
                        ),
                        const SizedBox(height: 15),
                      ],
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
