import 'package:get/get.dart';

import 'package:cp_driver_app/base/base_refresh_controller.dart';
import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/enum/response_status.dart';
import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/logger/class_name.dart';
import 'package:cp_driver_app/pages/my/repository/my_collect_repository.dart';
import 'package:cp_driver_app/enum/scroll_view_action_type.dart';
import 'package:cp_driver_app/account_manager/account_manager.dart';

class MyCollectController
    extends BaseRefreshController<MyCollectRepository, ArticleInfoDatas> {
  @override
  void onInit() {
    super.onInit();
    initPage = Get.find(tag: className(MyCollectController));
    page = initPage;
    refreshController = Get.find(tag: className(MyCollectController));
  }

  @override
  Future<void> onRefresh() async {
    page = initPage;
    await aRequest(type: ScrollViewActionType.refresh);
  }

  @override
  Future<void> onLoadMore() async {
    page = page + 1;
    await aRequest(type: ScrollViewActionType.loadMore);
  }

  @override
  Future<void> aRequest({
    required ScrollViewActionType type,
    Map<String, dynamic>? parameters,
  }) async {
    response =
        await request.getCollectArticleList(page: page).catchError((error) {
      return processError(type: type, error: error);
    });
    status = response?.responseStatus ?? ResponseStatus.loading;

    final models = response?.data?.dataSource ?? [];

    switch (type) {
      case ScrollViewActionType.refresh:
        dataSource.clear();
        dataSource.addAll(models);
        break;
      case ScrollViewActionType.loadMore:
        dataSource.addAll(models);
        break;
    }

    refreshControllerStatusUpdate(type);

    update();
  }

  Future<void> unCollectAction({required int index}) async {
    final model = await request.unCollectAction(
        originId: dataSource[index].originId ?? 0);

    String message;
    if (model.isSuccess) {
      if ((AccountManager().info?.collectIds ?? [])
          .contains(dataSource[index].originId)) {
        (AccountManager().info?.collectIds ?? [])
            .remove(dataSource[index].originId);
      }
      dataSource.removeAt(index);
      message = "取消收藏成功";
    } else {
      message = model.errorMsg.toString();
    }

    Get.snackbar(
      "",
      message,
      duration: const Duration(seconds: 1),
    );

    update();
  }

  void removeUnCollectItem(IWebLoadInfo webLoadInfo) {
    final data =
        dataSource.firstWhere((element) => element.link == webLoadInfo.link);
    dataSource.remove(data);

    update();
  }
}
