/*
 * @Author: 米亚流年 miyaliunian@gmail.com
 * @Date: 2023-10-21 11:03:59
 * @LastEditors: 米亚流年 miyaliunian@gmail.com
 * @LastEditTime: 2023-10-22 09:59:09
 * @FilePath: /GetXStudy/lib/env/app_env_config.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
enum Environment { dev, sit, uat, prod }

abstract class AppEnvironment {
  static late String baseApiUrl;
  static late String title;
  static late Environment _environment;
  static Environment get environment => _environment;
  static setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.dev:
        {
          baseApiUrl = 'https://api-dev.com';
          title = 'Flutter flavors dev';
          break;
        }
      case Environment.sit:
        {
          baseApiUrl = 'https://api-sit.com';
          title = 'Flutter flavors sit';
          break;
        }
      case Environment.uat:
        {
          baseApiUrl = 'https://api-uat.com';
          title = 'Flutter flavors uat';
          break;
        }
      case Environment.prod:
        {
          baseApiUrl = 'https://api-prod.com';
          title = 'Flutter flavors prod';
          break;
        }
      default:
    }
  }
}
