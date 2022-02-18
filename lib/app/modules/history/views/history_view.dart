import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonsmoke/app/modules/home/controllers/home_controller.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  HomeController hc = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('历史记录'),
        centerTitle: true,
        backgroundColor: hc.isLight.value ? Colors.cyan : null,
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.brown,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.smoking_rooms),
                      SizedBox(
                        width: 10,
                      ),
                      Text('抽烟数量:'),
                      Spacer(),
                      Text('1'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.money_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text('尼古丁:'),
                      Spacer(),
                      Text(hc.nigu.value),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text('时间:'),
                      Spacer(),
                      Text(hc.history[index].time),
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: hc.history.length,
        ),
      ),
    );
  }
}
