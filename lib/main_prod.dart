import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:getx_study/account_manager/account_manager.dart';
import 'package:getx_study/base/app_env_config.dart';
import 'package:getx_study/my_app.dart';

void main() {
  print("caller:Prod");
  AppEnvironment.setupEnv(Environment.prod);
  run();
}

run() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final isFirst = await AccountManager().getIsFirstLaunch();
  print("当前运行环境:${AppEnvironment.title}");
  runApp(MyApp(isFirst: isFirst));
}
