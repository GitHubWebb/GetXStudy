import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/entity/page_entity.dart';
import 'package:cp_driver_app/http_util/request.dart' as http;
import 'package:cp_driver_app/http_util/api.dart';

class MyCollectRepository extends IRepository {
  Future<BaseEntity<PageEntity<List<ArticleInfoDatas>>>> getCollectArticleList(
          {required int page}) =>
      http.Request.get(
          api: "${Api.getCollectArticleList}${page.toString()}/json");

  Future<BaseEntity<Object?>> unCollectAction({required int originId}) =>
      http.Request.post(
          api: "${Api.postUnCollectArticle}${originId.toString()}/json");
}
