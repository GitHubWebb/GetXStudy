import 'package:get/get.dart';

import 'package:cp_driver_app/pages/main/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainController(),
    );
  }
}