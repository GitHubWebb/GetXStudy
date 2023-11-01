import '../../../base/interface.dart';
import '../../../entity/article_info_entity.dart';
import '../../../entity/banner_entity.dart';
import '../../../entity/base_entity.dart';
import '../../../entity/car/price_plan_entity.dart';
import '../../../entity/page_entity.dart';
import '../../../http_util/api.dart';
import '../../../http_util/request.dart' as http;

class CarDetailRepository extends IRepository {
  Future<BaseEntity<List<BannerEntity>>> getBanner() =>
      http.Request.get(api: Api.getBanner);

  Future<BaseEntity<List<ArticleInfoDatas>>> getTopArticleList() =>
      http.Request.get(api: Api.getTopArticleList);

  Future<BaseEntity<PageEntity<List<ArticleInfoDatas>>>> getArticleList(
          {required int page}) =>
      http.Request.get(api: "${Api.getArticleList}${page.toString()}/json");

  /** 获取价格方案数据集合 */
  Future<BaseEntity<List<PricePlanEntity>>> getPricePlanList(
      {required int page}) =>
      http.Request.get(api: "${Api.getArticleList}${page.toString()}/json");
}
