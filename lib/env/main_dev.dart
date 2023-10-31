import 'package:cp_driver_app/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../account_manager/account_manager.dart';
import '../env/app_env_config.dart';
import '../my_app.dart';

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

  await Storage().init();

  final isFirst = await AccountManager().getIsFirstLaunch();
  print("当前运行环境:${AppEnvironment.title}");
  runApp(MyApp(isFirst: isFirst));
}
