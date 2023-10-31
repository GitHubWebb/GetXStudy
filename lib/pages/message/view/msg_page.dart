import 'package:base_module/speak_app_bar.dart';
import 'package:cp_driver_app/extension/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../logger/logger.dart';
import '../../../routes/routes.dart';
import '../../../pages/common/status_view.dart';
import '../../../pages/message/controller/msg_controller.dart';
import '../../../pages/common/refresh_header_footer.dart';
import '../../common/home/msg_detail_cell.dart';

/**
 * desc  : 消息页面
 * author: wangwx
 * date  : 2023-10-27
 */
class MessagePage extends GetView<MsgController> {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: SpeakAppBar(
          leading: true,
          title: "登录",
          backIconColor: const Color(0xFF525252),
          backgroundColor: const Color(0xF9F9F9),
        ),
      ),
      body: StatusView<MsgController>(
        contentBuilder: (controller) {
          return SmartRefresher(
            enablePullUp: true,
            header: const RefreshHeader(),
            footer: const RefreshFooter(),
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoadMore,
            child: CustomScrollView(
              slivers: <Widget>[
                buildMsgContentItemSliverList(controller),
              ],
            ),
          );
        },
      ),
    );
  }

  //<editor-fold desc="消息列表">
  /** 底部 详细信息列表 */
  Widget buildMsgContentItemSliverList(MsgController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (content, index) {
          final model = controller.dataSource[index];
          return Container(
            padding: const EdgeInsets.all(0.0),
            child: MsgDetailCell(
              position: index,
              itemCount: controller.dataSource.length,
              model: model,
              callback: (_) async {
                logger.d("点击了");
                if (model.id == 24742) {
                  if (model.link != null) {
                    final url =
                        Uri.parse(model.link.toString().replaceHtmlElement);
                    if (await canLaunchUrl(url)) {
                      launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      Get.snackbar(
                        "",
                        "请安装手机QQ",
                        duration: const Duration(seconds: 1),
                      );
                    }
                  }
                } else {
                  Get.toNamed(Routes.myCollect, arguments: model);
                }
              },
            ),
          );
        },
        childCount: controller.dataSource.length,
      ),
    );
  }
//</editor-fold>
}
