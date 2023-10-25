import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/coin_rank_entity.dart';
import 'package:cp_driver_app/entity/page_entity.dart';
import 'package:cp_driver_app/http_util/request.dart' as http;
import 'package:cp_driver_app/http_util/api.dart';

class CoinRankRepository extends IRepository {
  Future<BaseEntity<PageEntity<List<CoinRankDatas>>>> getCoinRankList(
          int page) =>
      http.Request.get(api: "${Api.getRankingList}${page.toString()}/json");
}
