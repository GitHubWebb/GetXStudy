import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/http_util/request.dart' as http;
import 'package:cp_driver_app/http_util/api.dart';

class WebRepository extends IRepository {
  Future<BaseEntity<Object?>> unCollectAction({required int originId}) =>
      http.Request.post(
          api: "${Api.postUnCollectArticle}${originId.toString()}/json");

  Future<BaseEntity<Object?>> collectAction({required int originId}) =>
      http.Request.post(api: "${Api.postCollectArticle}${originId.toString()}/json");
}
