import 'package:cp_driver_app/base/base_refresh_controller.dart';
import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/entity/banner_entity.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/page_entity.dart';
import 'package:cp_driver_app/enum/response_status.dart';
import 'package:cp_driver_app/enum/scroll_view_action_type.dart';
import 'package:cp_driver_app/logger/class_name.dart';
import 'package:cp_driver_app/logger/logger.dart';
import 'package:cp_driver_app/pages/home/repository/home_repository.dart';
import 'package:get/get.dart';

class MyOrderFulfillmentController
    extends BaseRefreshController<HomeRepository, ArticleInfoDatas> {
  MyOrderFulfillmentController();

  var banners = [];

  // var tabsName = ['待签约', '待支付', '待提车', '履约中', '已完成', '已取消'];
  var tabsName = ['待签约'];

  var swiperAutoPlay = false;

  @override
  void onInit() {
    super.onInit();
    initPage = Get.find<int>(tag: className(MyOrderFulfillmentController));
    page = initPage;
    refreshController = Get.find(tag: className(MyOrderFulfillmentController));
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
    response = await request.getArticleList(page: page).catchError((error) {
      return processError(type: type, error: error);
    });
    status = response?.responseStatus ?? ResponseStatus.loading;

    final models = response?.data?.dataSource ?? [];

    switch (type) {
      case ScrollViewActionType.refresh:
        final result = await Future.wait(
          [
            request.getBanner(),
            request.getTopArticleList(),
            request.getArticleList(page: page),
          ],
          cleanUp: (successValue) => logger.d(successValue),
        );

        if (result.length == 3) {
          final bannerModels = result[0].data as List<BannerEntity>;
          final topArticleModels = result[1].data as List<ArticleInfoDatas>;
          response =
              result[2] as BaseEntity<PageEntity<List<ArticleInfoDatas>>>;
          final articleModels = response?.data?.dataSource ?? [];

          /// 轮播图赋值
          banners = bannerModels;
          swiperAutoPlay = banners.length > 1 ? true : false;

          /// 列表赋值
          dataSource = topArticleModels;
          dataSource.addAll(articleModels);
        } else {
          response = BaseEntity(null, null, null);

          swiperAutoPlay = false;
        }

        break;
      case ScrollViewActionType.loadMore:
        response = await request.getArticleList(page: page);
        dataSource.addAll(models);
        break;
    }

    refreshControllerStatusUpdate(type);

    update();
  }
}
