import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonsmoke/app/modules/home/controllers/home_controller.dart';
import 'package:oktoast/oktoast.dart';

import 'app/routes/app_pages.dart';

void main() async {
  HomeController controller = Get.put(HomeController());
  runApp(
    OKToast(
      child: Obx(
        () {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            theme: ThemeData(
              brightness: controller.isLight.value == true
                  ? Brightness.light
                  : Brightness.dark,
              //判断 夜间/白天模式
            ),
          );
        },
      ),
    ),
  );
}
