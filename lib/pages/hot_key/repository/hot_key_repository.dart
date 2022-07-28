import 'package:getx_study/base/interface.dart';
import 'package:getx_study/entity/base_entity.dart';
import 'package:getx_study/entity/hot_key_entity.dart';
import 'package:getx_study/entity/page_entity.dart';
import 'package:getx_study/http_util/request.dart' as Moya;
import 'package:getx_study/http_util/api.dart';

class HotKeyRepository extends IRepository {
  
  Future<BaseEntity<List<HotKeyEntity>>> getHotKey()
   => Moya.Request.get(api: Api.getSearchHotKey);
}