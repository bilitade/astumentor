import 'package:flutter/material.dart';
import 'package:get/get.dart';

buildBottomNavigationMenu(context, HomeController) {
  const TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  return Obx(() => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SizedBox(
        height: 54,
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: HomeController.changeTabIndex,
          currentIndex: HomeController.tabIndex.value,
          backgroundColor: Color.fromRGBO(35,181,116,1),
          unselectedItemColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          selectedItemColor: Colors.white,
          unselectedLabelStyle: unselectedLabelStyle,
          selectedLabelStyle: selectedLabelStyle,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.newspaper_outlined,
                  size: 20.0,
                ),
              ),
              label: 'Post Feed',
            ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //     margin: const EdgeInsets.only(bottom: 7),
            //     child: const Icon(
            //       Icons.groups,
            //       size: 20.0,
            //     ),
            //   ),
            //   label: 'Groups',
            //   backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            // ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.panorama_horizontal_outlined,
                  size: 20.0,
                ),
              ),
              label: 'Maps',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.chat,
                  size: 20.0,
                ),
              ),
              label: 'pano',
            ),
          ],
        ),
      )));
}
