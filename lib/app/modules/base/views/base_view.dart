import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基本信息'),
        centerTitle: true,
        backgroundColor: controller.hc.isLight.value ? Colors.cyan : null,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                  () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '填写基本信息',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          '请设置你的必要信息，以便统计，为您的情况做一个直观体现',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '昵称',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: TextField(
                                textAlign: TextAlign.center,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: controller.nickname.value.isEmpty
                                      ? '请输入昵称'
                                      : controller.nickname.value,
                                ),
                                onChanged: (v) async {
                                  controller.nickname.value = v.toString();
                                  controller.configData();
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '年龄',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: controller.age.value.isEmpty
                                      ? '请输入数字'
                                      : controller.age.value,
                                ),
                                onChanged: (v) async {
                                  controller.age.value = v.toString();
                                  controller.configData();
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '烟龄',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: controller.years.value.isEmpty
                                        ? '请输入数字'
                                        : controller.years.value),
                                onChanged: (v) async {
                                  controller.years.value = v.toString();
                                  controller.configData();
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '单价',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: controller.price.value.isEmpty
                                        ? '请输入数字'
                                        : controller.price.value),
                                onChanged: (v) async {
                                  controller.price.value = v.toString();
                                  controller.configData();
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '焦油量',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: controller.jiaoyou.value.isEmpty
                                        ? '请输入数字'
                                        : controller.jiaoyou.value,
                                    suffix: Text('mg')),
                                onChanged: (v) async {
                                  controller.jiaoyou.value = v.toString();
                                  controller.configData();
                                },
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '尼古丁量',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: controller.nigu.value.isEmpty
                                      ? '请输入数字'
                                      : controller.nigu.value,
                                ),
                                onChanged: (v) async {
                                  controller.nigu.value = v.toString();
                                  controller.configData();
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Obx(
                          () => TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.transparent,
                              ),
                              side: MaterialStateProperty.all(
                                BorderSide(width: 1, color: Colors.red),
                              ),
                            ),
                            onPressed: () {
                              controller.login();
                            },
                            child: Text(
                              controller.hc.isLogin.value ? '确定修改' : '开启戒烟之旅',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
