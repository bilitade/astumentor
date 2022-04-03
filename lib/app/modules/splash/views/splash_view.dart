import 'dart:async';

import 'package:flutter/material.dart';
import '';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetWidget<SplashController> {
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Color.fromRGBO(9, 32, 63, 1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/logos/logo.svg',
                            width: 160.11,
                            height: 107.86,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SvgPicture.asset(
                          'assets/images/logos/logotext.svg',
                          width: 201.41,
                          height: 77.67,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: const GFLoader(type: GFLoaderType.circle),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
