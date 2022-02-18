import 'dart:convert';

import 'package:get/get.dart';
import 'package:nonsmoke/app/data/model.dart';
import 'package:nonsmoke/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxBool isLight = false.obs;
  RxBool isLogin = false.obs;
  RxList<Model> history = RxList([]);
  Rx<Model> current = Rx(Model(num: '0', time: '', spend: '0'));
  RxString age = ''.obs;
  RxString price = ''.obs;
  RxString years = ''.obs;
  RxString jiaoyou = ''.obs;
  RxString nigu = ''.obs;
  RxString ctime = ''.obs;
  RxString num = '0'.obs;
  RxString spend = '0'.obs;

  RxDouble h = 200.0.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void configData() async {
    final prefs = await SharedPreferences.getInstance();
    age.value = prefs.getString(Constant.age) ?? '';
    years.value = prefs.getString(Constant.year) ?? '';
    price.value = prefs.getString(Constant.price) ?? '';
    nigu.value = prefs.getString(Constant.niguding) ?? '';
    jiaoyou.value = prefs.getString(Constant.jiaoyou) ?? '';
  }

  void tap() async {
    final prefs = await SharedPreferences.getInstance();
    price.value = prefs.getString(Constant.price) ?? '';
    num.value = current.value.num.isEmpty
        ? '1'
        : (int.parse(current.value.num) + 1).toString();
    spend.value = current.value.num.isEmpty
        ? '0'
        : (int.parse(num.value) / 20 * int.parse(price.value))
            .toStringAsFixed(2);
    DateTime time = DateTime.now();
    ctime.value = time.hour.toString() + ':' + time.minute.toString();
    current.value.time = ctime.value;
    current.value.spend = spend.value;
    current.value.num = num.value;
    history.add(current.value);
    String s = json.encode(history);
    prefs.setString(Constant.list, s);
    /***
     * 心脏图片放大缩小
     */
    await Future.delayed(Duration(milliseconds: 100), () async {
      h.value = 220.0;
      await Future.delayed(Duration(milliseconds: 100), () async {
        h.value = 180.0;
        await Future.delayed(Duration(milliseconds: 100), () async {
          h.value = 200.0;
        });
      });
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
