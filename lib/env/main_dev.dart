import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cp_driver_app/account_manager/account_manager.dart';
import 'package:cp_driver_app/env/app_env_config.dart';
import 'package:cp_driver_app/my_app.dart';

void main() {
  AppEnvironment.setupEnv(Environment.dev);
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
