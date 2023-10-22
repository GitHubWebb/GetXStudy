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
