import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nonsmoke/app/data/model.dart';
import 'package:nonsmoke/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/modules/home/controllers/home_controller.dart';
import 'constant.dart';

/// @date: 2022/2/17 8:39 下午
/// @author: admin
/// @description: dart

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  HomeController hc = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () async {
      final prefs = await SharedPreferences.getInstance();
      final list = prefs.getString(Constant.list);
      hc.configData();
      if (list != null) {
        List l = json.decode(list);
        l.forEach((element) {
          Model m = Model.fromJson(element);
          if (!hc.history.contains(m)) {
            hc.history.add(m);
          }
        });
        hc.num.value = hc.history.last.num;
        hc.ctime.value = hc.history.last.time;
        hc.spend.value = hc.history.last.spend;
      }
      print(list);
      print(hc.history);
      bool login = prefs.getBool(Constant.hasLogin) ?? false;
      if (login) {
        hc.isLogin.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.BASE);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
