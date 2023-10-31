import '../../../base/interface.dart';
import '../../../entity/article_info_entity.dart';
import '../../../entity/banner_entity.dart';
import '../../../entity/base_entity.dart';
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
}

/* 瞬间觉得自己写的HomeRepository不香了
class HomeRepository extends IRepository {
  Future<BaseEntity<List<BannerEntity>>> getBanner() =>
      requestClient.getBanner();

  Future<BaseEntity<List<ArticleInfoDatas>>> getTopArticleList() =>
      requestClient.getTopArticleList();

  Future<BaseEntity<PageEntity<List<ArticleInfoDatas>>>> getArticleList(
          {required int page}) =>
      requestClient.getArticleList(page);
}
 */
