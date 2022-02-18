import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonsmoke/app/modules/home/controllers/home_controller.dart';
import 'package:nonsmoke/app/routes/app_pages.dart';
import 'package:oktoast/oktoast.dart';

/// @date: 2022/2/17 5:27 下午
/// @author: admin
/// @description: dart
///

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController hc = Get.find<HomeController>();
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 88,
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.BASE);
            },
            child: Row(
              children: [
                Text(
                  '基本信息',
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(Routes.HISTORY);
            },
            child: Row(
              children: [
                Text(
                  '历史记录',
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              hc.isLight.value = !hc.isLight.value;
            },
            child: Row(
              children: [
                Text('日间/夜间'),
                Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showToast('已是最新版本');
            },
            child: Row(
              children: [
                Text('版本更新'),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
