import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import "package:cp_driver_app/base/base_controller.dart";
import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/enum/scroll_view_action_type.dart';
import 'package:cp_driver_app/enum/response_status.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/page_entity.dart';
import 'package:cp_driver_app/logger/logger.dart';

abstract class BaseRefreshController<R extends IRepository, T> extends BaseController {
  late R request;

  late RefreshController refreshController;

  late int page;

  late int initPage;

  BaseEntity<PageEntity<List<T>>>? response;

  List<T> dataSource = [];

  @override
  void onInit() async {
    super.onInit();
    request = Get.find<R>();
  }

  @override
  void onClose() {
    super.onClose();
    logger.d("onClose");
  }

  Future<void> onRefresh() async {}

  Future<void> onLoadMore() async {}

  Future<void> aRequest({
    required ScrollViewActionType type,
    Map<String, dynamic>? parameters,
  }) async {}

  void refreshControllerStatusUpdate(ScrollViewActionType type) {
    switch (type) {
      case ScrollViewActionType.refresh:
        refreshController.refreshCompleted(resetFooterState: true);
        if (response?.data?.curPage == response?.data?.pageCount) {
          refreshController.loadNoData();
        }
        break;
      case ScrollViewActionType.loadMore:
        if (response?.data?.curPage == response?.data?.pageCount) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }

        checkDataSourceAndStatus();
        break;
    }
  }

  void checkDataSourceAndStatus() {
    if (status == ResponseStatus.successNoData && dataSource.isNotEmpty) {
      status = ResponseStatus.successHasContent;
    }

    if (status == ResponseStatus.fail && dataSource.isNotEmpty) {
      status = ResponseStatus.successHasContent;
    }
  }

  void failHandle(ScrollViewActionType type) {
    if (type == ScrollViewActionType.loadMore) {
      page = page - 1;
    }

    status = ResponseStatus.fail;

    refreshControllerStatusUpdate(type);
  }

  @override
  void retry() {
    onRefresh();
  }

  @override
  void emptyTap() {
    onRefresh();
  }

  processError({required ScrollViewActionType type, required dynamic error}) {
    failHandle(type);
    update();
    return error;
  }
}
