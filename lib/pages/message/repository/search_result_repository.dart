import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/entity/page_entity.dart';
import 'package:cp_driver_app/http_util/request.dart' as http;
import 'package:cp_driver_app/http_util/api.dart';

class SearchResultRepository extends IRepository {
  Future<BaseEntity<PageEntity<List<ArticleInfoDatas>>>> searchKeyword(
      {required int page, required String keyword}) async {
    final params = <String, String>{};
    params["k"] = keyword;
    return await http.Request.post(
        api: "${Api.postQueryKey}${page.toString()}/json", params: params);
  }
}
