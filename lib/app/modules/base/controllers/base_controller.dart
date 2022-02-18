import 'package:get/get.dart';
import 'package:nonsmoke/app/modules/home/controllers/home_controller.dart';
import 'package:nonsmoke/app/routes/app_pages.dart';
import 'package:nonsmoke/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseController extends GetxController {
  HomeController hc = Get.find<HomeController>();

  RxString age = ''.obs;
  RxString price = ''.obs;
  RxString years = ''.obs;
  RxString jiaoyou = ''.obs;
  RxString nigu = ''.obs;
  RxString nickname = ''.obs;

  RxBool enabled = false.obs;

  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    age.value = prefs.getString(Constant.age) ?? '';
    years.value = prefs.getString(Constant.year) ?? '';
    price.value = prefs.getString(Constant.price) ?? '';
    nigu.value = prefs.getString(Constant.niguding) ?? '';
    jiaoyou.value = prefs.getString(Constant.jiaoyou) ?? '';
    nickname.value = prefs.getString(Constant.nickname) ?? '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  void configData() {
    enabled.value = false;
    if (nickname.isEmpty) {
      return;
    }
    if (age.isEmpty || int.parse(age.value) <= 0) {
      return;
    }
    if (years.isEmpty || int.parse(years.value) <= 0) {
      return;
    }
    if (price.isEmpty || int.parse(price.value) <= 0) {
      return;
    }
    if (nigu.isEmpty || int.parse(nigu.value) <= 0) {
      return;
    }
    if (jiaoyou.isEmpty || int.parse(jiaoyou.value) <= 0) {
      return;
    }
    enabled.value = true;
  }

  void login() async {
    if (!enabled.value) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constant.age, age.value);
    await prefs.setString(Constant.year, years.value);
    await prefs.setString(Constant.price, price.value);
    await prefs.setString(Constant.niguding, nigu.value);
    await prefs.setString(Constant.jiaoyou, jiaoyou.value);
    await prefs.setString(Constant.nickname, nickname.value);
    await prefs.setBool(Constant.hasLogin, true);
    if (hc.isLogin.value) {
      Get.back();
    } else {
      hc.configData();
      Get.toNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
}
