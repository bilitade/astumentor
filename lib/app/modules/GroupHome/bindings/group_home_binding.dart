import 'package:get/get.dart';

import '../controllers/group_home_controller.dart';

class GroupHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupHomeController>(
      () => GroupHomeController(),
    );
  }
}
