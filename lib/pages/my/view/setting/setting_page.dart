import 'dart:io';

import 'package:base_module/speak_app_bar.dart';
import 'package:cp_driver_app/pages/my/widgets/set_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../extension/string_extension.dart';
import '../../../../logger/logger.dart';
import '../../../../routes/routes.dart';

/**
 * desc  : 设置页面
 * author: wangwx
 * date  : 2023-11-03
 */
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late PackageInfo _packageInfo;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      logger.d("setState$info");
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    logger.d("build$_packageInfo");
    super.build(context);
    return Scaffold(
      appBar: SpeakAppBar(
        leading: true,
        title: "设置",
        backIconColor: const Color(0xFF525252),
        backgroundColor: const Color(0xF9F9F9),
      ),
      body: SafeArea(
        child: Container(
          color: const Color(0XFFF9F9F9),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: buildColumnItem(),
          ),
        ),
      ),
    );
  }

  //<editor-fold desc="设置item项">
  /// 设置item项
  Widget buildColumnItem() {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          SetItemWidget(
              title: "隐私协议", value: null, onTap: () => logger.d("点击隐私协议")),
          SetItemWidget(
              title: "用户协议", value: null, onTap: () => logger.d("点击用户协议")),
          SetItemWidget(
              title: "关于",
              value: "当前版本 ${_packageInfo.version}",
              onTap: () => logger.d("点击关于")),
          SetItemWidget(
              title: "退出登录", value: null, onTap: () => logger.d("点击退出登录")),
        ],
      ),
    );
  }

//</editor-fold>
}
