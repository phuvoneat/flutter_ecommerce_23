import 'package:flutter_ecommerce_23/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  final box = GetStorage();
  var currentIndex = 0;

  void logout() {
    box.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }

  void onTab(int index) {
    currentIndex = index;
    update();
  }
}
