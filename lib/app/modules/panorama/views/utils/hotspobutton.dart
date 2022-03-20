import 'package:flutter/material.dart';

Widget hotspotButton({String? text, IconData? icon, VoidCallback? onPressed}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          backgroundColor: MaterialStateProperty.all(Colors.black38),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Icon(icon),
        onPressed: onPressed,
      ),
      text != null
          ? Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(193, 240, 9, 9),
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Center(child: Text(text)),
            )
          : Container(),
    ],
  );
}
