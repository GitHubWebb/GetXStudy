import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/enum/tag_type.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/tab_entity.dart';
import 'package:cp_driver_app/http_util/request.dart' as http;

class TabsRepository extends IRepository {
  TabsRepository(this.type);

  TagType type;

  Future<BaseEntity<List<TabEntity>>> getTab() =>
      http.Request.get(api: type.tabApi);
}
