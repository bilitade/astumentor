import 'dart:developer';

import 'package:astumentor/app/data/Model/ApiResponse.dart';
import 'package:astumentor/app/data/Model/user.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/services/auth_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeController extends GetxController {
  var tabIndex = 0.obs;
  var user = User(image: '', name: '', email: '').obs;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();

    getUser();
    messaging.getToken().then((value) {
      print(value);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);

      Get.defaultDialog(
        title: "Notification",
        middleText: "Hello world!",
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        titleStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        middleTextStyle: const TextStyle(color: Color.fromARGB(255, 1, 78, 244)),
        content: Text(event.notification!.body!),
        actions: [
          TextButton(
            child: const Text("Ok"),
            onPressed: () {
              Get.back();
            },
          )
        ],



      );



      

      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text("Notification"),
      //         content: Text(event.notification!.body!),
      //         actions: [
      //           TextButton(
      //             child: Text("Ok"),
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //           )
      //         ],
      //       );
      //     });
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void Logout() {
    user.value = User(image: '', name: '', email: '');
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
