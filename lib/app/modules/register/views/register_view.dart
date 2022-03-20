import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getwidget/getwidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetWidget<RegisterController> {
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
                      GFCard(
                        boxFit: BoxFit.cover,
                        titlePosition: GFPosition.start,
                        content: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: controller.registerFormKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: controller.emailController,
                                  validator: (v) {
                                    return controller.validateEmail(v!);
                                  },
                                  onSaved: (v) {},
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: "email",
                                    prefixIcon: const Icon(Icons.email),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: controller.passwordController,
                                  validator: (v) {
                                    return controller.passwordlen(v!);
                                  },
                                  onSaved: (v) {},
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: "password",
                                    prefixIcon: const Icon(Icons.password),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: controller.cnController,
                                  validator: (v) {
                                    return controller.validatePassword(v!);
                                  },
                                  onSaved: (v) {},
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: " Confirm Password",
                                    prefixIcon: const Icon(Icons.password),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Obx(() => controller.isloading.value == true
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : const Text("")),
                                GFButton(
                                  onPressed: () {
                                    if (controller.registerFormKey.currentState!
                                        .validate()) {
                                      controller.Register();
                                    }
                                  },
                                  text: "Register",
                                  size: 40,
                                  color: Colors.blue,
                                  shape: GFButtonShape.pills,
                                  fullWidthButton: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Already have Account?"),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    focusColor: Colors.blue,
                                    onTap: () => Get.back(),
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
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
