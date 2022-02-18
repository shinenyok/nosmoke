import 'package:get/get.dart';
import 'package:nonsmoke/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoController extends GetxController {
  //TODO: Implement InfoController

  RxString age = ''.obs;
  RxString price = ''.obs;
  RxString years = ''.obs;
  RxString jiaoyou = ''.obs;
  RxString nigu = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    final prefs = await SharedPreferences.getInstance();
    age.value = prefs.getString(Constant.age) ?? '';
    years.value = prefs.getString(Constant.year) ?? '';
    price.value = prefs.getString(Constant.price) ?? '';
    nigu.value = prefs.getString(Constant.niguding) ?? '';
    jiaoyou.value = prefs.getString(Constant.jiaoyou) ?? '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
