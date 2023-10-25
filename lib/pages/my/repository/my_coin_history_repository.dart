import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/my_coin_history_entity.dart';
import 'package:cp_driver_app/entity/page_entity.dart';
import 'package:cp_driver_app/http_util/request.dart' as http;
import 'package:cp_driver_app/http_util/api.dart';

class MyCoinHistoryRepository extends IRepository {
  Future<BaseEntity<PageEntity<List<MyCoinHistoryDatas>>>> getCoinRankList(
          int page) =>
      http.Request.get(api: "${Api.getCoinList}${page.toString()}/json");
}