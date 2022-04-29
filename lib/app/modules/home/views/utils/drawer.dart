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
              colors: <Color>[Colors.blueAccent, Colors.blue],
            ),
          ),
          currentAccountPicture: CircleAvatar(
            radius: 50,
            child: Obx(() => ClipOval(
      //          child: FadeInImage.memoryNetwork(
      //                 placeholder: kTransparentImage,
      //                 imageErrorBuilder: (context, error, StackTrace) {
      //                       return const Image(
      //                           height: 38,
      //                           width: 38,
      //                           image: AssetImage("assets/extra/broken.png"));
      //                     }, 
      //                   image:controller.user.value.image,
      //                 fit: BoxFit.contain,
      // )
child: CachedNetworkImage(
                                         fit: BoxFit.contain,
                                        imageUrl:controller.user.value.image
                                            ,
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            SizedBox(
                                                height: 50.0,
                                               width: 50.0,
                                              child: CircularProgressIndicator(
                                                
                                                  value:
                                                      downloadProgress.progress),
                                            ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),


      
      )
      
      ),
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
          leading: Icon(Icons.event),
          title: Text('Events'),
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
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap: null,
        ),
      ],
    ),
  );
}
