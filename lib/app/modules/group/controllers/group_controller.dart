import 'dart:developer';

import 'package:astumentor/app/data/Model/ApiResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/services/group_service.dart';

class GroupController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final myGroupList = <dynamic>[].obs;
  final otherGroupList = <dynamic>[].obs;
  final mGroupLoading = true.obs;
  final oGroupLoading = true.obs;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'My Group'),
    const Tab(text: 'More Group'),
  ];

  late TabController tabcontroller;

  @override
  Future<void> onInit() async {
       getMyGroup();
       getOtherGroup();
    super.onInit();
    tabcontroller = TabController(vsync: this, length: myTabs.length);

  }

  Future<void> getMyGroup() async {
    ApiResponse mresponse = await mygroup();
    if (mresponse.error == null) {
      inspect(mresponse.data);

      myGroupList.value = mresponse.data as List<dynamic>;

      mGroupLoading.value =
          mGroupLoading.value ? !mGroupLoading.value : mGroupLoading.value;
    } else {
      Get.snackbar("error", "'${mresponse.error}'");
    }
  }

  Future<void> getOtherGroup() async {
    ApiResponse oresponse = await otherGroup();
    if (oresponse.error == null) {
      inspect(oresponse.data);

      otherGroupList.value = oresponse.data as List<dynamic>;

      mGroupLoading.value =
          oGroupLoading.value ? !oGroupLoading.value : oGroupLoading.value;
    } else {
      Get.snackbar("error", "'${oresponse.error}'");
    }
  }

  @override
  void onClose() {
    tabcontroller.dispose();
    super.onClose();
  }
}
