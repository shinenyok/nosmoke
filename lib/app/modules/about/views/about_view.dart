import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonsmoke/app/modules/home/controllers/home_controller.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  HomeController hc = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于我们'),
        centerTitle: true,
        backgroundColor: hc.isLight.value ? Colors.cyan : null,
      ),
      body: Center(
        child: Text(
          '吸烟有害健康，戒烟可减少对健康的危害',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
