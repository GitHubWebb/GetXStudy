/*
 * @Author: 米亚流年 miyaliunian@gmail.com
 * @Date: 2023-10-20 10:14:29
 * @LastEditors: 米亚流年 miyaliunian@gmail.com
 * @LastEditTime: 2023-10-20 18:20:22
 * @FilePath: /GetXStudy/lib/pages/my/repository/my_repository.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:cp_driver_app/base/interface.dart';
import 'package:cp_driver_app/entity/base_entity.dart';
import 'package:cp_driver_app/entity/coin_rank_entity.dart';

import 'package:cp_driver_app/http_util/request.dart' as http;
import 'package:cp_driver_app/http_util/api.dart';
import 'package:cp_driver_app/entity/account_info_entity.dart';

class MyRepository extends IRepository {
  Future<BaseEntity<AccountInfoEntity>> login(
      {required String username, required String password}) async {
    final params = <String, String>{};
    params["username"] = username;
    params["password"] = password;
    return await http.Request.post(api: Api.postLogin, params: params);
  }

  Future<BaseEntity<AccountInfoEntity>> register(
      {required String username,
      required String password,
      required String rePassword}) async {
    final params = <String, String>{};
    params["username"] = username;
    params["password"] = password;
    params["repassword"] = rePassword;
    return await http.Request.post(api: Api.postRegister, params: params);
  }

  Future<BaseEntity<Object?>> logout() => http.Request.get(api: Api.getLogout);

  Future<BaseEntity<CoinRankDatas>> getUserCoinInfo() =>
      http.Request.get(api: Api.getUserCoinInfo);
}
