import 'package:cp_driver_app/logger/class_name.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';

import 'package:cp_driver_app/pages/my/controller/my_collect_controller.dart';
import 'package:cp_driver_app/pages/my/repository/my_collect_repository.dart';

class MyCollectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MyCollectRepository(),
    );
    Get.lazyPut(
      tag: className(MyCollectController),
      () => RefreshController(initialRefresh: true),
    );
    Get.lazyPut<int>(
      tag: className(MyCollectController),
      () => 0,
    );
    Get.lazyPut(
      () => MyCollectController(),
    );
  }
}