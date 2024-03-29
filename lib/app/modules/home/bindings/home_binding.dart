import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../map/controllers/map_controller.dart';
import '../../Post/controllers/post_controller.dart';
import '../../panorama/controllers/panorama_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<PostController>(
      () => PostController(),
    );
    Get.lazyPut<PanoramaController>(
      () => PanoramaController(),
    );
    Get.lazyPut<PanoramaController>(
      () => PanoramaController(),
    );

Get.lazyPut<MapController>(
      () => MapController(),
    );

  }
}
