import 'package:get/get.dart';

import '../controllers/panorama_controller.dart';

class PanoramaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanoramaController>(
      () => PanoramaController(),
    );
  }
}
