import 'package:cp_driver_app/pages/common/keep_alive_wrapper.dart';
import 'package:cp_driver_app/pages/common/refresh_header_footer.dart';
import 'package:cp_driver_app/pages/common/status_view.dart';
import 'package:cp_driver_app/pages/my/controller/my_order_%20canceled_controller.dart';
import 'package:cp_driver_app/pages/my/controller/my_order_done_controller.dart';
import 'package:cp_driver_app/pages/my/controller/my_order_fulfillment_controller.dart';
import 'package:cp_driver_app/pages/my/controller/my_order_paid_controller.dart';
import 'package:cp_driver_app/pages/my/controller/my_order_pick_up_controller.dart';
import 'package:cp_driver_app/pages/my/controller/my_order_signed_controller.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_order_cancel_item.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_order_done_item.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_order_fulfillment_item.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_order_paid_item.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_order_pick_item.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_order_signed_item.dart';
import 'package:cp_driver_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controller/my_order_controller.dart';

class MyOrderPage extends GetView<MyOrderController> {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyOrderController>(
      id: "myOrder",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0XFFF9F9F9),
          appBar: AppBar(
            title: const Text("我的订单"),
            bottom: TabBar(
              controller: controller.tabController,
              isScrollable: true,
              tabs: controller.tabsName.map((e) => Tab(text: e)).toList(),
            ),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: <Widget>[
              KeepAliveWrapper(
                child: StatusView<MyOrderSignedController>(
                  contentBuilder: (signedController) {
                    return SmartRefresher(
                      enablePullUp: true,
                      header: const RefreshHeader(),
                      footer: const RefreshFooter(),
                      controller: signedController.refreshController,
                      onRefresh: signedController.onRefresh,
                      onLoading: signedController.onLoadMore,
                      child: ListView.builder(
                        itemCount: signedController.dataSource.length,
                        itemBuilder: (context, index) {
                          return TabOrderSignedItem(
                            onTap: () {
                              print('待签约被点击');
                              Get.toNamed(Routes.myOrderSigned);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              KeepAliveWrapper(
                child: StatusView<MyOrderPaidController>(
                  contentBuilder: (paidController) {
                    return SmartRefresher(
                      enablePullUp: true,
                      header: const RefreshHeader(),
                      footer: const RefreshFooter(),
                      controller: paidController.refreshController,
                      onRefresh: paidController.onRefresh,
                      onLoading: paidController.onLoadMore,
                      child: ListView.builder(
                        itemCount: paidController.dataSource.length,
                        itemBuilder: (context, index) {
                          return TabOrderPaidItem(
                            onTap: () {
                              print('待签约被点击');
                              Get.toNamed(Routes.myOrderPaid);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              KeepAliveWrapper(
                child: StatusView<MyOrderPickUpController>(
                  contentBuilder: (pickController) {
                    return SmartRefresher(
                      enablePullUp: true,
                      header: const RefreshHeader(),
                      footer: const RefreshFooter(),
                      controller: pickController.refreshController,
                      onRefresh: pickController.onRefresh,
                      onLoading: pickController.onLoadMore,
                      child: ListView.builder(
                        itemCount: pickController.dataSource.length,
                        itemBuilder: (context, index) {
                          return TabOrderPicUpkItem(
                            onTap: () {
                              print('待签约被点击');
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              KeepAliveWrapper(
                child: StatusView<MyOrderFulfillmentController>(
                  contentBuilder: (full) {
                    return SmartRefresher(
                      enablePullUp: true,
                      header: const RefreshHeader(),
                      footer: const RefreshFooter(),
                      controller: full.refreshController,
                      onRefresh: full.onRefresh,
                      onLoading: full.onLoadMore,
                      child: ListView.builder(
                        itemCount: full.dataSource.length,
                        itemBuilder: (context, index) {
                          return TabOrderFulfillmentItem(
                            onTap: () {
                              print('待签约被点击');
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              KeepAliveWrapper(
                child: StatusView<MyOrderDoneController>(
                  contentBuilder: (doneController) {
                    return SmartRefresher(
                      enablePullUp: true,
                      header: const RefreshHeader(),
                      footer: const RefreshFooter(),
                      controller: doneController.refreshController,
                      onRefresh: doneController.onRefresh,
                      onLoading: doneController.onLoadMore,
                      child: ListView.builder(
                        itemCount: doneController.dataSource.length,
                        itemBuilder: (context, index) {
                          return TabOrderDoneItem(
                            onTap: () {
                              print('待签约被点击');
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              KeepAliveWrapper(
                child: StatusView<MyOrderCanceledController>(
                  contentBuilder: (cancelController) {
                    return SmartRefresher(
                      enablePullUp: true,
                      header: const RefreshHeader(),
                      footer: const RefreshFooter(),
                      controller: cancelController.refreshController,
                      onRefresh: cancelController.onRefresh,
                      onLoading: cancelController.onLoadMore,
                      child: ListView.builder(
                        itemCount: cancelController.dataSource.length,
                        itemBuilder: (context, index) {
                          return TabOrderCancelItem(
                            onTap: () {
                              print('待签约被点击');
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
