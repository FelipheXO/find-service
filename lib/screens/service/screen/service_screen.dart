part of '../service.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key, required this.services});
  final Services services;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            onPressed: () async {
              final Uri url =
                  Uri.parse('https://wa.me/${services.code}${services.number}');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            height: 50,
            color: Colors.green,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.whatsapp,
                    width: 22,
                    height: 22,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Whatsapp',
                    style: customBig(context, bold: true, color: Colors.white),
                  ),
                ],
              ),
            ),
            buttonText: '',
          ),
          const SizedBox(height: 10),
          CustomButton(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            onPressed: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: services.email,
              );

              launchUrl(emailLaunchUri);
            },
            height: 50,
            color: AppColor.grey,
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    'E-mail',
                    style: customBig(context, bold: true, color: Colors.white),
                  ),
                ],
              ),
            ),
            buttonText: '',
          ),
        ],
      ),
      appBar: customAppBar(context, title: 'Service'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.secudary),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        services.title ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: customSuperBig(context, bold: true),
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          services.des ?? '',
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: customBig(context),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Posted at: ${AppDateFormat.millisecondsSinceEpochToDate(services.createdAt!)}',
                          style: customSmall(context),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColor.primary),
                            child: Text(
                              services.name!.toUpperCase()[0],
                              style: customSuperBig(context,
                                  color: Colors.white, bold: true),
                            ),
                          ),
                          const SizedBox(width: 7),
                          SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  services.name.toString(),
                                  style: customMedium(context, bold: false),
                                ),
                                Text(
                                  services.city.toString(),
                                  style: customMedium(context, bold: true),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '\$ ${services.value}',
                            style: customSuperBig(context, bold: true),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
