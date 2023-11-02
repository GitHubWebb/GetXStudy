import 'package:cp_driver_app/pages/common/home/info_cell.dart';
import 'package:cp_driver_app/resource/assets_image_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:cp_driver_app/env/app_env_config.dart';
import 'package:cp_driver_app/logger/logger.dart';
import 'package:cp_driver_app/pages/common/home/home_car_info_cell.dart';
import 'package:cp_driver_app/pages/common/my_list_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cp_driver_app/extension/string_extension.dart';
import 'package:cp_driver_app/routes/routes.dart';
import 'package:cp_driver_app/pages/common/status_view.dart';
import 'package:cp_driver_app/pages/home/controller/home_controller.dart';
import 'package:cp_driver_app/pages/common/refresh_header_footer.dart';

/**
 * desc  : 首页 - 车辆列表页
 * author: wangwx
 * date  : 2023-10-25
 */
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding:
            EdgeInsetsDirectional.only(start: 15, top: 0, end: 0, bottom: 0),
        //添加背景色
        backgroundColor: Colors.white,
        leading: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              child: SizedBox(
                width: 25.w,
                height: 25.h,
                child: CachedNetworkImage(
                  fit: BoxFit.fitHeight,
                  imageUrl: '',
                  errorWidget: (context, url, error) =>
                      Image.asset(AssetsImageConstant.defaultAvatar),
                  placeholder: (context, url) =>
                      Image.asset(AssetsImageConstant.defaultAvatar),
                ),
              ),
            ),
            buildBarCityInkWell(),
            buildBarSearchText(),
          ],
        ),
      ),
      child: StatusView<HomeController>(
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
                buildCarSliverList(controller)
              ],
            ),
          );
        },
      ),
    );
  }

  //<editor-fold desc="navigationBar 左侧切换城市">
  /// navigationBar 左侧切换城市
  Widget buildBarCityInkWell() {
    return InkWell(
      onTap: () {
        EasyLoading.showToast("点击芜湖, 选择城市");
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "芜湖",
              style: TextStyle(color: Color(0XFF1B1B1B), fontSize: 12),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 5,
              top: 3,
            ),
            child: const Icon(Icons.keyboard_arrow_down_rounded,
                size: 20, color: Color(0XFF818181)),
          ),
        ],
      ),
    );
  }
  //</editor-fold>

  //<editor-fold desc="navigationBar 搜索框">
  /// navigationBar 搜索框
  Widget buildBarSearchText() {
    return Expanded(
            child: InkWell(
              onTap: () => Get.toNamed(Routes.hotKey),
              child: Container(
                  margin: const EdgeInsets.only(left: 4, right: 14),
                  color: Color(0XFFF8F8F8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 17,
                          top: 6,
                          bottom: 6,
                        ),
                        child: Image.asset(
                          AssetsImageConstant.homePageSearchIcon,
                          width: 14.w,
                          height: 14.h,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          "首页:${AppEnvironment.title}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0XFFC9C9C9),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          );
  }
//</editor-fold>

  //<editor-fold desc="车辆列表List">
  /// 车辆列表List
  SliverList buildCarSliverList(HomeController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (content, index) {
          final model = controller.dataSource[index];
          return Container(
            padding: const EdgeInsets.all(0.0),
            color: const Color(0XFFF9F9F9),
            child: HomeCarInfoCell(
              model: model,
              callback: (_) async {
                logger.d("点击了");
                if (model.id == 24742) {
                  if (model.link != null) {
                    final url = Uri.parse(
                        model.link.toString().replaceHtmlElement);
                    if (await canLaunchUrl(url)) {
                      launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      Get.snackbar(
                        "",
                        "请安装手机QQ",
                        duration: const Duration(seconds: 1),
                      );
                    }
                  }
                } else {
                  Get.toNamed(Routes.carDetail, arguments: model);
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
