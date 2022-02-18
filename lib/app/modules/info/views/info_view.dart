import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonsmoke/app/modules/home/controllers/home_controller.dart';

import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  HomeController hc = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基本信息'),
        centerTitle: true,
        backgroundColor: hc.isLight.value ? Colors.cyan : null,
      ),
      body: Obx(() => Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      '年龄',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(controller.age.value)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '烟龄',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(controller.years.value)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '单价',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(controller.price.value)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '焦油量',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(controller.jiaoyou.value)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      '尼古丁量',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(controller.nigu.value)
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
