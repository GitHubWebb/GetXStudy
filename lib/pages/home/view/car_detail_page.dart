import 'dart:io';

import 'package:base_module/speak_app_bar.dart';
import 'package:cp_driver_app/generated/assets.dart';
import 'package:cp_driver_app/pages/common/home/home_car_detail_cell.dart';
import 'package:cp_driver_app/resource/assets_image_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
 * desc  : 车辆详情页面
 * author: wangwx
 * date  : 2023-10-26
 */
class CarDetailPage extends GetView<HomeController> {
  const CarDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpeakAppBar(
        leading: true,
        title: "车辆详情",
        backIconColor: const Color(0xFF525252),
        backgroundColor: const Color(0xF9F9F9),
      ),
      body: StatusView<HomeController>(
        contentBuilder: (controller) {
          return Container(
            color: const Color(0XFFF9F9F9),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                buildHeadBannerSliverAdapter(controller),
                buildCardInfoKongSliver(controller),
                buildCardDetailItemSliverList(controller),
              ],
            ),
          );
        },
      ),
    );
  }

  //<editor-fold desc="顶部Banner">
  /** 顶部Banner */
  Widget buildHeadBannerSliverAdapter(HomeController controller) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 43,
          top: 12,
          right: 54,
          // bottom: 12,
        ),
        child: AspectRatio(
          aspectRatio: 26 / 11,
          child: Swiper(
            itemBuilder: (BuildContext itemContext, int index) {
              if (controller.banners.length >= index) {
                return CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  imageUrl: controller.banners[index].imagePath,
                  placeholder: (context, url) => Image.asset(
                    "assets/images/placeholder.png",
                  ),
                );
              } else {
                return Container();
              }
            },
            itemCount: controller.banners.length,
            pagination: const SwiperPagination(),
            autoplay: controller.swiperAutoPlay,
            autoplayDisableOnInteraction: true,
            onTap: (index) {
              logger.d(index);
              Get.toNamed("/web/true", arguments: controller.banners[index]);
            },
          ),
        ),
      ),
    );
  }

  //</editor-fold>

  //<editor-fold desc="车辆信息金刚区">
  /** 车辆信息金刚区 */
  Widget buildCardInfoKongSliver(HomeController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (content, index) {
          final model = controller.dataSource[index];
          return Container(
            margin:
                const EdgeInsets.only(left: 10, top: 12, right: 10, bottom: 14),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              // shape: BoxShape.circle,
              // 阴影的颜色，模糊半径
              boxShadow: [BoxShadow(color: Color(0XFFD7D7D7), blurRadius: 1)],
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 11),
                  child: Text(
                    "奇瑞-艾瑞泽E-2021款 智行版",
                    style:
                        TextStyle(fontSize: 12, color: const Color(0xFF323232)),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 0, top: 4, right: 0),
                  child: Image.asset(
                    Assets.homeBgCarInfoLine,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 13, bottom: 22),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 7),
                            child: Image.asset(
                              Assets.homeIconCarMgmt,
                              width: 20,
                              height: 19,
                            ),
                          ),
                          Text(
                            "12-24个月",
                            style: TextStyle(
                                color: Color(0xFF191818), fontSize: 12),
                          ),
                          Text(
                            "车龄",
                            style: TextStyle(
                                color: Color(0xFFB0B0B0), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 51, top: 17, right: 56, bottom: 22),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Image.asset(
                              Assets.homeIconVehicleMileage,
                              width: 18,
                              height: 18,
                            ),
                          ),
                          Text(
                            "10万公里以内",
                            style: TextStyle(
                                color: Color(0xFF191818), fontSize: 12),
                          ),
                          Text(
                            "里程（公里）",
                            style: TextStyle(
                                color: Color(0xFFB0B0B0), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 17, bottom: 22),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Image.asset(
                              Assets.homeIconCarStock,
                              width: 20,
                              height: 16,
                            ),
                          ),
                          Text(
                            "现车",
                            style: TextStyle(
                                color: Color(0xFF191818), fontSize: 12),
                          ),
                          Text(
                            "提车周期",
                            style: TextStyle(
                                color: Color(0xFFB0B0B0), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

//</editor-fold>

  //<editor-fold desc="底部 详细信息列表">
  /** 底部 详细信息列表 */
  Widget buildCardDetailItemSliverList(HomeController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (content, index) {
          final model = controller.dataSource[index];
          return Container(
            padding: const EdgeInsets.all(0.0),
            child: HomeCarDetailCell(
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
