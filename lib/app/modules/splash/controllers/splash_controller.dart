import 'dart:async';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/services/auth_service.dart';
import 'package:get/get.dart';
import '../../../data/config.dart';
import '../../../routes/app_pages.dart';
import '../../../data/Model/ApiResponse.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    Timer(const Duration(seconds: 5), () => _loadUserInfo());

    super.onInit();
  }

  void _loadUserInfo() async {
    String token = await getToken();

    if (token == '') {
      Get.toNamed(Routes.LOGIN);
    } else {
      Get.toNamed(Routes.HOME);
      ApiResponse response = await getUserDetail();
      // ApiResponse response = await getUserDetail();

      // if (response.error == null) {
      //   Get.toNamed(Routes.HOME);
      // } else if (response.error == unauthorized) {
      //   SharedPreferences pref = await SharedPreferences.getInstance();
      //   await pref.remove('token');
      //   Get.toNamed(Routes.LOGIN);
      //   Get.snackbar("message", "unauthorized");
      // } else {
      //   inspect(response.error);
      //   Get.toNamed(Routes.LOGIN);
      //   Get.snackbar("Error", "${response.error}");
      // }
    }
  }
}
