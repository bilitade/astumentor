import 'dart:developer';

import 'package:astumentor/app/data/Model/ApiResponse.dart';
import 'package:astumentor/app/data/Model/user.dart';

import '../../../routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/services/auth_service.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  var user = User(image: '',name: '',email: '').obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void Logout() {
    user.value = User(image: '',name: '',email: '');
    logout();
    Get.offAllNamed(Routes.LOGIN);
  }

  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      user.value = response.data as User;
    }
  }
}
