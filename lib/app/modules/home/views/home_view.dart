import '../../Post/views/post_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../panorama/views/panorama_view.dart';

import 'package:get/get.dart';
import './utils/bottomNav.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff23047).withOpacity(0.5),
      appBar: AppBar(
        title: Text('ASTU MENTOR', style: GoogleFonts.lato()),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "Confrim",
                    middleText: "Are you sure you want to logout? ",
                    backgroundColor: Colors.white,
                    titleStyle: TextStyle(color: Colors.black),
                    middleTextStyle: TextStyle(color: Colors.black),
                    onCancel: () {},
                    onConfirm: () {
                      controller.Logout();
                    });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      body: Obx(() => Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: IndexedStack(
              index: controller.tabIndex.value,
              children: [
                Container(
                  child: PostView(),
                ),
                PanoramaView()
              ],
            ),
          )),
    );
  }
}
