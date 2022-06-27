import 'package:astumentor/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildDrawer(context, controller) {
  return GFDrawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        GFDrawerHeader(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color.fromRGBO(35, 181, 116, 1),
                Color.fromRGBO(35, 181, 116, 0.7)
              ],
            ),
          ),
          currentAccountPicture: CircleAvatar(
            radius: 50,
            child: Obx(() => ClipOval(
                  child: (controller.user.value.image != "")
                      ? CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: controller.user.value.image,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                      : Icon(Icons.error),
                )),
            backgroundColor: Colors.white,
          ),
          child: Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 5,
                  ),
                  Text(controller.user.value.name),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(controller.user.value.email),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              )),
        ),
        ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          selected: true,
          leading: const Icon(Icons.home),
          title: Text(
            'Home',
            style: GoogleFonts.lato(),
          ),
          onTap: null,
        ),
        const ListTile(
          leading: Icon(Icons.photo),
          title: Text('Announcements'),
          onTap: null,
        ),
        const ListTile(
          leading: Icon(Icons.bookmarks),
          title: Text('Curiculum'),
          onTap: null,
        ),
        const ListTile(
          leading: Icon(Icons.bookmark_add_rounded),
          title: Text('My Classes'),
          onTap: null,
        ),
        const ListTile(
          leading: Icon(Icons.event),
          title: Text('Events'),
          onTap: null,
        ),
        ListTile(
          leading: Icon(Icons.group),
          title: Text('Groups'),
          onTap: () {
            Get.toNamed(Routes.GROUP);
          },
        ),
        const ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap: null,
        ),
      ],
    ),
  );
}
