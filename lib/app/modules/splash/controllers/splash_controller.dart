import 'dart:async';
import '../../../data/services/auth_service.dart';
import 'package:get/get.dart';
import '../../../data/config.dart';
import '../../../routes/app_pages.dart';
import '../../../data/Model/ApiResponse.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    Timer(const Duration(seconds: 5), () => Get.toNamed("/login"));
    _loadUserInfo();

    super.onInit();
  }

  void _loadUserInfo() async {
    String token = await getToken();
    if (token == '') {
      Get.toNamed('/login');
    } 
    else {
      ApiResponse response = await getUserDetail();
      
      if (response.error == null) {
        Get.toNamed(Routes.HOME);
      } else if (response.error == unauthorized) {
        Get.off(Routes.LOGIN);
        Get.snackbar("message", "unauthorized");
      } else {
        Get.toNamed(Routes.LOGIN);
        Get.snackbar("Error", "${response.error}");
      }
    }
  }
}
