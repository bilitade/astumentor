import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/group_home_controller.dart';

class GroupHomeView extends GetView<GroupHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GroupHomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'GroupHomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
