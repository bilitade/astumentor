import 'package:flutter/material.dart';
import '../../../data/services/auth_service.dart';
import '../../../data/Model/user.dart';
import '../../../data/config.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/Model/ApiResponse.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var isloading = false.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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

    super.dispose();
  }

  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Get.toNamed(Routes.HOME);
  }

  void loginUser() async {
    isloading(true);
    ApiResponse response =
        await login(emailController.text, passwordController.text);
    isloading(false);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else if (response.error == unauthorized) {
      Get.snackbar("message", "unauthorized");
    } else {
      Get.snackbar("Error", "${response.error}");
    }

    // Future<void> login() async {
    //   bool isvalidate = loginFormKey.currentState!.validate();
    //   if (isvalidate) {
    //     isloading.value = true;

    //     try {
    //       var data = await authService.login(
    //           email: emailController.text,
    //           password: passwordController.text,
    //           devicename: "android");

    //       if (data != null && data is! String) {
    //         print(data);

    //         //   await storage.write(key: 'name', value: user.user.name);
    //         // await storage.write(key: "token", value: data.token);

    //         Get.snackbar("login", "login Success",
    //             icon: const Icon(Icons.person, color: Colors.green),
    //             backgroundGradient: const LinearGradient(
    //                 colors: [Colors.blue, Colors.blueAccent]),
    //             snackPosition: SnackPosition.BOTTOM,
    //             margin: const EdgeInsets.fromLTRB(0, 0, 0, 15));
    //       }
    //       if (data != null && data == "Http status error [302]") {
    //         Get.snackbar("login", "Incorrect Crediential",
    //             icon: const Icon(Icons.person, color: Colors.green),
    //             backgroundGradient: const LinearGradient(
    //                 colors: [Colors.blue, Colors.blueAccent]),
    //             snackPosition: SnackPosition.BOTTOM,
    //             margin: const EdgeInsets.fromLTRB(0, 0, 0, 15));
    //       }
    //       if (data != null && data == "Http status error [404]") {
    //         Get.snackbar("login", "Server is Down  |404",
    //             icon: const Icon(Icons.person, color: Colors.green),
    //             snackPosition: SnackPosition.BOTTOM,
    //             margin: const EdgeInsets.fromLTRB(0, 0, 0, 15));
    //       }
    //     } finally {
    //       isloading.value = false;
    //     }
    //   }
    // }
  }
}
