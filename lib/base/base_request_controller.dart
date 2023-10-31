import 'package:get/get.dart';

import "../base/base_controller.dart";
import '../base/interface.dart';
import '../entity/base_entity.dart';

abstract class BaseRequestController<R extends IRepository, T> extends BaseController {
  late R request;

  BaseEntity<T>? response;

  T? data;

  @override
  void onInit() async {
    super.onInit();
    request = Get.find<R>();
  }

  Future<void> aRequest({
    Map<String, dynamic>? parameters,
  }) async {}

  @override
  void retry() {
    aRequest();
  }

  @override
  void emptyTap() {
    aRequest();
  }
}
