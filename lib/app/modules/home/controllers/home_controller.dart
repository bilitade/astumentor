import '../../../routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/services/auth_service.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void Logout() {
    logout();
    Get.toNamed(Routes.LOGIN);
  }
}
