import 'package:get/get.dart';

class PanoramaController extends GetxController {
  var val = 0.obs;

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

  void swap( int num) {
    val.value = num;
  }
}
