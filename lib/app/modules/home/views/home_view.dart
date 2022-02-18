import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonsmoke/app/modules/home/views/drawer.dart';
import 'package:nonsmoke/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: controller.isLight.value ? Colors.cyan : null,
          title: Text('今日抽烟'),
          centerTitle: true,
          leading: TextButton.icon(
              onPressed: () {
                Get.toNamed(Routes.ABOUT);
              },
              icon: Icon(
                Icons.messenger_outline_rounded,
                color: Colors.yellowAccent,
              ),
              label: Text('')),
          actions: [
            Builder(builder: (context) {
              return TextButton.icon(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.yellowAccent,
                  ),
                  label: Text(''));
            })
          ],
        ),
        drawer: HomeDrawer(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.smoking_rooms),
                    SizedBox(
                      width: 10,
                    ),
                    Text('今日抽烟量:'),
                    Spacer(),
                    Text('${controller.num.value}支'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.timer),
                    SizedBox(
                      width: 10,
                    ),
                    Text('上次抽烟时间:'),
                    Spacer(),
                    Obx(() => Text(controller.ctime.value)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.money_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Text('今日抽烟花费:'),
                    Spacer(),
                    Text(controller.spend.value),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(Icons.timeline_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Text('建议间隔:'),
                    Spacer(),
                    Text('4h'),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onDoubleTap: () {
                    controller.tap();
                  },
                  child: Container(
                    height: controller.h.value,
                    width: controller.h.value,
                    decoration: BoxDecoration(
                      // color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                          Radius.circular(controller.h.value / 2)),
                    ),
                    child: Image.asset(
                      'images/a.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.smoke_free), Text('双击上方图片抽一根')],
                ),
                Expanded(child: Container()),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    children: [
                      Icon(Icons.warning),
                      Expanded(child: Text('为了您的健康，请尽快戒烟'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
