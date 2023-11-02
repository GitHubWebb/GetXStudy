import 'package:cp_driver_app/entity/coin_rank_entity.dart';
import 'package:cp_driver_app/generated/json/base/json_convert_content.dart';

CoinRankEntity $CoinRankEntityFromJson(Map<String, dynamic> json) {
  final CoinRankEntity coinRankEntity = CoinRankEntity();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    coinRankEntity.curPage = curPage;
  }
  final List<CoinRankDatas>? datas = (json['datas'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<CoinRankDatas>(e) as CoinRankDatas)
      .toList();
  if (datas != null) {
    coinRankEntity.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    coinRankEntity.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    coinRankEntity.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    coinRankEntity.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    coinRankEntity.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    coinRankEntity.total = total;
  }
  return coinRankEntity;
}

Map<String, dynamic> $CoinRankEntityToJson(CoinRankEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['curPage'] = entity.curPage;
  data['datas'] = entity.datas?.map((v) => v.toJson()).toList();
  data['offset'] = entity.offset;
  data['over'] = entity.over;
  data['pageCount'] = entity.pageCount;
  data['size'] = entity.size;
  data['total'] = entity.total;
  return data;
}

extension CoinRankEntityExtension on CoinRankEntity {
  CoinRankEntity copyWith({
    int? curPage,
    List<CoinRankDatas>? datas,
    int? offset,
    bool? over,
    int? pageCount,
    int? size,
    int? total,
  }) {
    return CoinRankEntity()
      ..curPage = curPage ?? this.curPage
      ..datas = datas ?? this.datas
      ..offset = offset ?? this.offset
      ..over = over ?? this.over
      ..pageCount = pageCount ?? this.pageCount
      ..size = size ?? this.size
      ..total = total ?? this.total;
  }
}

CoinRankDatas $CoinRankDatasFromJson(Map<String, dynamic> json) {
  final CoinRankDatas coinRankDatas = CoinRankDatas();
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    coinRankDatas.coinCount = coinCount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    coinRankDatas.level = level;
  }
  final int? rank = jsonConvert.convert<int>(json['rank']);
  if (rank != null) {
    coinRankDatas.rank = rank;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    coinRankDatas.userId = userId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    coinRankDatas.username = username;
  }
  return coinRankDatas;
}

Map<String, dynamic> $CoinRankDatasToJson(CoinRankDatas entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinCount'] = entity.coinCount;
  data['level'] = entity.level;
  data['rank'] = entity.rank;
  data['userId'] = entity.userId;
  data['username'] = entity.username;
  return data;
}

extension CoinRankDatasExtension on CoinRankDatas {
  CoinRankDatas copyWith({
    int? coinCount,
    int? level,
    int? rank,
    int? userId,
    String? username,
  }) {
    return CoinRankDatas()
      ..coinCount = coinCount ?? this.coinCount
      ..level = level ?? this.level
      ..rank = rank ?? this.rank
      ..userId = userId ?? this.userId
      ..username = username ?? this.username;
  }
}
