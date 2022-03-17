import 'dart:async';
import 'dart:developer';

import 'package:flopro/app/data/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../../../data/services/auth_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isloading = false.obs;
  final AuthService authService = AuthService();
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController, cnController;
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cnController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    emailController.text = "broswarner2007@gmail.com";
    passwordController.text = "password";
    super.onReady();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    cnController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    bool isvalidate = loginFormKey.currentState!.validate();
    if (isvalidate) {
      isloading.value = true;

      try {
        var user = await authService.login(
            email: emailController.text,
            password: passwordController.text,
            devicename: "android");

        if (user != null && user is! String) {

          
          Get.snackbar("login", "login Success",
              icon: const Icon(Icons.person, color: Colors.green),
              backgroundGradient: const LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent]),
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15));

        }
        if (user != null && user == "Http status error [302]") {
          Get.snackbar("login", "Incorrect Crediential",
              icon: const Icon(Icons.person, color: Colors.green),
              backgroundGradient: const LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent]),
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15));
        }
        if (user != null && user == "Http status error [404]") {
          Get.snackbar("login", "Server is Down  |404",
              icon: const Icon(Icons.person, color: Colors.green),
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15));
        }
      } finally {
        isloading.value = false;
      }
    }
  }
}
