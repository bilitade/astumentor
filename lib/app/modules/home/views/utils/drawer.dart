import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildDrawer() {
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
          // currentAccountPicture: CircleAvatar(
          //   radius: 50,
          //   child: ClipOval(
          //       child: Image.asset(
          //     'assets/images/profile.jpg',
          //   )),
          //   backgroundColor: Colors.white,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              SizedBox(
                height: 5,
              ),
              Text('Bilisuma Tadesse'),
              SizedBox(
                height: 5,
              ),
              Text('Broswarner2007@gmail.com'),
              SizedBox(
                height: 5,
              ),
            ],
          ),
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
          leading: Icon(Icons.vrpano),
          title: Text('Panoroma'),
          onTap: null,
        ),
        const ListTile(
          leading: Icon(Icons.school),
          title: Text('Schools'),
          onTap: null,
        ),
        const ListTile(
          leading: Icon(Icons.chat),
          title: Text('Chat'),
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
