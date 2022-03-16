import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    wait();

    super.onInit();
  }

  Future wait() async {
    await Future.delayed(const Duration(seconds: 5))
        .then((value) => Get.toNamed('/login'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
