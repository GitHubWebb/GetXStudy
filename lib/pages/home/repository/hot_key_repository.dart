import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/hot_key_entity.dart';
import 'package:cp_driver_app/http_util/request.dart' as http;
import 'package:cp_driver_app/http_util/api.dart';

class HotKeyRepository extends IRepository {
  Future<BaseEntity<List<HotKeyEntity>>> getHotKey() =>
      http.Request.get(api: Api.getSearchHotKey);
}
