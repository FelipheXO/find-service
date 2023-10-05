part of '../home.dart';

class _BuildCard extends StatelessWidget {
  const _BuildCard({required this.services});
  final Services services;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      height: 150,
      color: AppColor.secudary,
      onPressed: () {
        Get.to(ServiceScreen(services: services));
      },
      buttonText: '',
      padding: const EdgeInsets.all(10),
      widget: SizedBox(
          width: Get.width,
          child: Column(
            children: [
              Text(
                services.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: customSuperBig(context, bold: true),
              ),
              Container(
                height: 35,
                alignment: Alignment.center,
                child: Text(
                  services.des ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: customMedium(context),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Posted at: ${AppDateFormat.millisecondsSinceEpochToDate(services.createdAt!)}',
                  style: customSmall(context),
                ),
              ),
              const SizedBox(height: 3),
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
          )),
    );
  }
}
