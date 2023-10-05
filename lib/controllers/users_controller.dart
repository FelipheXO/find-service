import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_service/model/user.dart';
import 'package:find_service/ultis/global.dart';
import 'package:find_service/ultis/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersController extends GetxController implements GetxService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Users? _users;
  Users? get users => _users;

  Future<void> siginUp(BuildContext context, Users user) async {
    _isLoading = true;
    update();
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      final String userId = userCredential.user!.uid;
      await setSharedPreferences(userId);
      await firestore
          .collection(Global.tableUsers)
          .doc(userId)
          .set(user.toJson());
      Get.offAllNamed(AppRoutes.splash);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Error in registration, check the fields',
          ),
        ),
      );
    }
    _isLoading = false;
    update();
  }

  Future<void> siginIn(
      BuildContext context, String email, String password) async {
    _isLoading = true;
    update();
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final String userId = userCredential.user!.uid;
      await setSharedPreferences(userId);
      Get.offAllNamed(AppRoutes.splash);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Invalid login or email',
          ),
        ),
      );
    }
    _isLoading = false;
    update();
  }

  Future<void> getUser() async {
    _isLoading = true;
    _users = null;
    update();
    String id = await getId();
    if (id != '') {
      final result =
          await firestore.collection(Global.tableUsers).doc(id).get();
      _users = Users.fromFirestore(result, id);
    }
    _isLoading = false;
    update();
  }

  Future<void> editUser(Users user) async {
    _isLoading = true;
    _users = null;
    update();
    String id = await getId();
    if (id != '') {
      await firestore
          .collection(Global.tableUsers)
          .doc(id)
          .update(user.toJson());
      await getUser();
    }
    _isLoading = false;
    update();
  }

  Future<bool> setSharedPreferences(String id) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(Global.userId, id);
  }

  Future<String> getId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(Global.userId) ?? '';
  }

  Future<void> logout() async {
    await setSharedPreferences('');
    Get.offAllNamed(AppRoutes.splash);
  }
}
