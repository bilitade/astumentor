import 'package:astumentor/app/modules/chat/views/chat_view.dart';
import 'package:astumentor/app/modules/home/views/utils/drawer.dart';
import 'package:astumentor/app/modules/map/views/map_view.dart';
import 'package:flutter/services.dart';
import '../../Post/views/post_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../panorama/views/panorama_view.dart';
import '../../chat/views/chat_view.dart';
import 'package:get/get.dart';
import './utils/bottomNav.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(35,181,116,1),
           systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 5, 68, 40)
           ,),
    
          title:
              Text('ASTU MENTOR', style: GoogleFonts.lato(color: Colors.black)),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Confrim",
                      middleText: "Are you sure you want to logout? ",
                      backgroundColor: Colors.white,
                      titleStyle: const TextStyle(color: Colors.black),
                      middleTextStyle: const TextStyle(color: Colors.black),
                      onCancel: () {},
                      onConfirm: () {
                        controller.Logout();
                      });
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        bottomNavigationBar: buildBottomNavigationMenu(context, controller),
        body: Obx(
          () => Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: IndexedStack(
              index: controller.tabIndex.value,
              children: [
                PostView(),
                MapView(),
                PanoramaView(),
              ],
            ),
          ),
        ),
        drawer: buildDrawer(context, controller));
  }
}
