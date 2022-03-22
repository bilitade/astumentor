import 'package:astumentor/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/services/comment_service.dart';
import '../../../data/services/auth_service.dart';
import '../../../data/Model/ApiResponse.dart';
import '../../../data/config.dart';

class CommentController extends GetxController {
  //TODO: Implement CommentController

  TextEditingController txtCommentController = TextEditingController();

  final commentsList = <dynamic>[].obs;
  final loading = true.obs;
  int userId = 0;
  int editCommentId = 0;

  final count = 0.obs;
  @override
  void onInit() {
    GetComments();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<void> GetComments() async {
    userId = await getUserId();
    ApiResponse response = await getComments(Get.arguments[0]["postId"] ?? 0);

    if (response.error == null) {
      commentsList.value = response.data as List<dynamic>;
      loading.value = loading.value ? !loading.value : loading.value;
    } else if (response.error == unauthorized) {
      logout().then((value) => {Get.toNamed(Routes.LOGIN)});
    } else {
      Get.snackbar("error", '${response.error}');
    }
  }

// create comment
  void CreateComment() async {
    ApiResponse response = await createComment(
        Get.arguments[0]["postId"] ?? 0 ?? 0, txtCommentController.text);

    if (response.error == null) {
      txtCommentController.clear();
      GetComments();
    } else if (response.error == unauthorized) {
      logout().then((value) => {Get.toNamed(Routes.LOGIN)});
    } else {
      loading.value = false;
      Get.snackbar("error", '${response.error}');
    }
  }

  // edit comment
  void EditComment() async {
    ApiResponse response =
        await editComment(editCommentId, txtCommentController.text);

    if (response.error == null) {
      editCommentId = 0;
      txtCommentController.clear();
      GetComments();
    } else if (response.error == unauthorized) {
      logout().then((value) => {Get.toNamed(Routes.LOGIN)});
    } else {
      Get.snackbar("error", '${response.error}');
    }
  }

  // Delete comment
  void DeleteComment(int commentId) async {
    ApiResponse response = await deleteComment(commentId);

    if (response.error == null) {
      GetComments();
    } else if (response.error == unauthorized) {
      logout().then((value) => {Get.toNamed(Routes.LOGIN)});
    } else {
      Get.snackbar("error", '${response.error}');
    }
  }
}
