import 'package:get/get.dart';

import 'package:cp_driver_app/pages/my/controller/my_controller.dart';
import 'package:cp_driver_app/pages/my/repository/my_repository.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      fenix: true,
      () => MyRepository(),
    );
    Get.lazyPut(
      () => MyController(),
    );
  }
}
