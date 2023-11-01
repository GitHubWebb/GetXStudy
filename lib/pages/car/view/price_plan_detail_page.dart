import 'dart:io';

import 'package:base_module/speak_app_bar.dart';
import 'package:cp_driver_app/pages/car/controller/car_detail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import '../../../env/app_env_config.dart';
import '../../../generated/assets.dart';
import '../../../logger/logger.dart';
import '../../../pages/common/home/home_car_info_cell.dart';
import '../../../pages/common/my_list_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../extension/string_extension.dart';
import '../../../routes/routes.dart';
import '../../../pages/common/status_view.dart';
import '../../../pages/common/refresh_header_footer.dart';
import '../../common/home/home_car_price_plan_detail_cell.dart';
import '../controller/price_plan_detail_controller.dart';

/**
 * desc  : 价格方案详情页面
 * author: wangwx
 * date  : 2023-10-31
 */
class PricePlanDetailPage extends GetView<PricePlanDetailController> {
  const PricePlanDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.d(Get.arguments.toString());

    return Scaffold(
      appBar: SpeakAppBar(
        leading: true,
        title: "价格方案详情",
        backIconColor: const Color(0xFF525252),
        backgroundColor: const Color(0xF9F9F9),
      ),
      body: StatusView<PricePlanDetailController>(
        contentBuilder: (controller) {
          return Container(
            color: const Color(0XFFF9F9F9),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  buildCardInfo(),
                  buildPricePlanContentItemContainer(context, controller),
                  buildSubmitBtn(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //<editor-fold desc="车辆信息">
  /** 车辆信息金刚区 */
  Widget buildCardInfo() {
    return ListView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.only(left: 9, top: 2, right: 10, bottom: 13),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // shape: BoxShape.circle,
              // 阴影的颜色，模糊半径
              boxShadow: [BoxShadow(color: Color(0XFFD7D7D7), blurRadius: 1)],
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 14),
                  child: Text(
                    "奇瑞-艾瑞泽E-2021款 智行版",
                    style: TextStyle(
                        fontSize: 14.sp, color: const Color(0xFF323232)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 14, top: 13),
                      child: Row(
                        children: [
                          Text(
                            "车龄：",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                          Text(
                            "12-24个月",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14, top: 14),
                      child: Row(
                        children: [
                          Text(
                            "里程（公里）：",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                          Text(
                            "10万公里以内",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14, top: 15),
                      child: Row(
                        children: [
                          Text(
                            "提车周期：",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                          Text(
                            "现车",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14, top: 12),
                      child: Row(
                        children: [
                          Text(
                            "租期：",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                          Text(
                            "3期",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14, top: 14),
                      child: Row(
                        children: [
                          Text(
                            "租金：",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                          Text(
                            "￥3700.00/月",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14, top: 12),
                      child: Row(
                        children: [
                          Text(
                            "押金：",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                          Text(
                            "￥10000.00押金",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 14, top: 13),
                      child: Row(
                        children: [
                          Text(
                            "门店：",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                          Text(
                            "安徽麦卡出行汽车有限公司",
                            style: TextStyle(
                                color: Color(0xFF6D6D6D), fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 15, top: 9, bottom: 10),
                      child: Text(
                        "提前终止违约金比例20%",
                        style: TextStyle(color: Color(0xFFB0B0B0), fontSize: 9),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

//</editor-fold>

  //<editor-fold desc="底部 详细信息列表">
  /** 底部 内容 详细信息列表 */
  Container buildPricePlanContentItemContainer(
      BuildContext context, PricePlanDetailController controller) {
    return Container(
        margin: EdgeInsets.only(left: 9, right: 11, bottom: 0),
        padding: EdgeInsets.only(left: 14, right: 13, bottom: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // shape: BoxShape.circle,
          // 阴影的颜色，模糊半径
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD7D7D7),
              blurRadius: 1,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 1, top: 11, bottom: 9),
              child: Column(
                children: [
                  Text(
                    "基础服务",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xFF323232),
                    ),
                  ),
                  Container(
                    width: 46,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),
                ],
              ),
            ),
            buildPricePlanDetailItemList(controller),
          ],
        ));
  }

  /** 底部 详细信息列表 */
  Widget buildPricePlanDetailItemList(PricePlanDetailController controller) {
    return ListView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemCount: (controller.data ?? []).isEmpty
            ? 0
            : (controller.data ?? []).length,
        itemBuilder: (context, index) {
          var modelList = controller.data ?? [];
          if (modelList.isEmpty)
            return Container();
          else {
            final model = modelList[index];
            return Container(
              padding: const EdgeInsets.all(0.0),
              child: PricePlanDetailCell(
                position: index,
                // itemCount: controller.dataSource.length,
                itemCount: modelList.length,
                model: model,
                callback: (_) async {
                  /*
                  logger.d("点击了");
                  Get.toNamed(Routes.myCollect, arguments: model);
                  */
                },
              ),
            );
          }
        });
  }

//</editor-fold>

  //<editor-fold desc="立即支付定金">
  /** 立即支付定金 */
  Widget buildSubmitBtn(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, top: 14, right: 10, bottom: 13),
      child: TextButton(
        onPressed: () {
          controller.selectPayController.showSelectPayDialog();
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),

          //设置按钮的大小
          minimumSize: MaterialStateProperty.all(Size(72, 29)),
        ),
        child: Text(
          "立即支付定金",
          style: TextStyle(color: Color(0XFFFFFFFF), fontSize: 12.sp),
        ),
      ),
    );
  }
//</editor-fold>
}
