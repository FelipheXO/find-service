import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_service/model/services.dart';
import 'package:find_service/ultis/global.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController implements GetxService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> create(Services services) async {
    _isLoading = true;
    update();
    await firestore.collection(Global.tableServices).add(services.toJson());
    _isLoading = false;
    update();
  }

  Future<List<Services>> get() async {
    _isLoading = true;
    update();
    List<Services> services = [];
    final querySnapshot = await firestore
        .collection(Global.tableServices)
        .orderBy("createdAt", descending: true)
        .get();
    for (final service in querySnapshot.docs) {
      services.add(Services.fromFirestore(service, service.id));
    }
    _isLoading = false;
    update();
    return services;
  }
}
