import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/logos/logo.svg',
                            width: 80,
                            height: 53,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SvgPicture.asset(
                          'assets/images/logos/logotext.svg',
                          width: 99,
                          height: 33,
                        ),
                      ),
                      Container(
                        child: GFCard(
                          boxFit: BoxFit.cover,
                          titlePosition: GFPosition.start,
                          content: Form(
                              child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.email),
                                  hintText: 'Email',
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.password),
                                  hintText: 'Password',
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const GFLoader(type: GFLoaderType.ios),
                              const SizedBox(
                                height: 15,
                              ),
                              GFButton(
                                onPressed: () {},
                                text: "Login",
                                size: 40,
                                color: Colors.blue,
                                shape: GFButtonShape.pills,
                                fullWidthButton: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
