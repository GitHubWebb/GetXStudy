import 'package:get/get.dart';

import 'package:getx_study/base/base_refresh_controller.dart';
import 'package:getx_study/base/interface.dart';
import 'package:getx_study/entity/article_info_entity.dart';
import 'package:getx_study/entity/banner_entity.dart';
import 'package:getx_study/entity/base_entity.dart';
import 'package:getx_study/entity/page_entity.dart';
import 'package:getx_study/enum/response_status.dart';
import 'package:getx_study/entity/coin_rank_entity.dart';
import 'package:getx_study/pages/coin_rank/repository/coin_rank_repository.dart';
import 'package:getx_study/enum/scroll_view_action_type.dart';
import 'package:getx_study/pages/home/repository/home_repository.dart';
import 'package:getx_study/routes/routes.dart';

class HomeController
    extends BaseRefreshController<HomeRepository, ArticleInfoDatas>
    implements IClassName {
  final banners = [];

  @override
  void onInit() {
    super.onInit();
    initPage = Get.find<int>(tag: HomeController.className);
    page = initPage;
    refreshController = Get.find(tag: HomeController.className);
    onRefresh();
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
    response = await request.getArticleList(page: page);
    status = response?.responseStatus ?? ResponseStatus.loading;

    final models = response?.data?.dataSource ?? [];

    switch (type) {
      case ScrollViewActionType.refresh:
        dataSource.clear();
        banners.clear();

        final result = await Future.wait(
          [
            request.getBanner(),
            request.getTopArticleList(),
            request.getArticleList(page: page),
          ],
          cleanUp: (successValue) => print(successValue),
        );

        if (result.length == 3) {
          final bannerModels = result[0].data as List<BannerEntity> ?? [];
          final topArticleModels =
              result[1].data as List<ArticleInfoDatas> ?? [];
          response =
              result[2] as BaseEntity<PageEntity<List<ArticleInfoDatas>>>;
          final articleModels = response?.data?.dataSource ?? [];

          banners.addAll(bannerModels);
          dataSource.addAll(topArticleModels);
          dataSource.addAll(articleModels);
        } else {
          response = BaseEntity(null, null, null);
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

  void pushToHotKeyPage() {
    Get.toNamed(Routes.hotKey);
  }

  static String? get className => (HomeController).toString();
}
