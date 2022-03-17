import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void register() {}


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

  void Register(){

    
    

  }

}
