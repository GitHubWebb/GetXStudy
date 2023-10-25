import 'package:get/get.dart';

import 'package:cp_driver_app/pages/my/controller/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegisterController(),
    );
  }
}