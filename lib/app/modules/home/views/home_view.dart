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
      appBar: AppBar(
        title: Text('ASTU MENTOR', style: GoogleFonts.lato()),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.Logout();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: buildBottomNavigationMenu(context, controller),
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: [PostView(), PanoramaView()],
          )),
    );
  }
}
