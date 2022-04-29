import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/services/auth_service.dart';
import '../../../data/config.dart';
import '../../../data/services/postService.dart';

import '../../../data/Model/ApiResponse.dart';
import '../../../routes/app_pages.dart';

class PostController extends GetxController {
  final postList = <dynamic>[].obs;
  final isloading = true.obs;
  var userId = 0.obs;

  @override
  Future<void> onInit() async {
    retrievePosts();
    inspect(postList.value);
    super.onInit();
  }

  Future<void> retrievePosts() async {
    userId.value = await getUserId();
    ApiResponse response = await getPosts();

    if (response.error == null) {
      inspect(response.data);
      postList.value = response.data as List<dynamic>;

      isloading.value = isloading.value ? !isloading.value : isloading.value;
    } else if (response.error == unauthorized) {
      logout().then((value) => {Get.toNamed(Routes.LOGIN)});
    } else {
      Get.snackbar("error", "'${response.error}'");
    }
  }

  void handleDeletePost(int postId) async {
    ApiResponse response = await deletePost(postId);
    if (response.error == null) {
      retrievePosts();
    } else if (response.error == unauthorized) {
      logout().then((value) => {Get.toNamed(Routes.LOGIN)});
    } else {
      Get.snackbar("error", "'${response.error}'");
    }
  }

  // post like dislik
  void handlePostLikeDislike(int postId) async {
    ApiResponse response = await likeUnlikePost(postId);

    if (response.error == null) {
      retrievePosts();
    } else if (response.error == unauthorized) {
      logout().then((value) => {Get.toNamed(Routes.LOGIN)});
    } else {
      Get.snackbar("error", "'${response.error}'");
    }
  }
}
