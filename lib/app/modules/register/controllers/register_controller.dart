import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/auth_service.dart';
import '../../../data/Model/user.dart';
import '../../../data/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/Model/ApiResponse.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  var isloading = false.obs;
  final registerFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      emailController,
      passwordController,
      cnController;
  final count = 0.obs;
  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    cnController = TextEditingController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  String? validatename(String value) {
    if (value.length <= 3) {
      return "legit name required";
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "this is Wrong email";
    } else {
      return null;
    }
  }

  String? passwordlen(String value) {
    if (value.length <= 5) {
      return "too short password";
    } else {
      return null;
    }
  }

  String? validatePassword(String conf) {
    if (conf == passwordController.text) {
      return null;
    } else {
      return "Password doesnt match";
    }
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Get.toNamed(Routes.HOME);
  }

  Register() async {
    isloading(true);
    ApiResponse response = await register(
        nameController.text, emailController.text, passwordController.text);

    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      Get.snackbar("error", '${response.error}');
    }
  }
}
