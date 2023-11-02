import 'package:cp_driver_app/pages/common/keep_alive_wrapper.dart';
import 'package:cp_driver_app/pages/common/refresh_header_footer.dart';
import 'package:cp_driver_app/pages/common/status_view.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_all_controller.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_controller.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_overdue_controller.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_paid_controller.dart';
import 'package:cp_driver_app/pages/my/controller/bill/my_bill_to_paid_controller.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_bill_item.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_order_fulfillment_item.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_order_paid_item.dart';
import 'package:cp_driver_app/pages/my/widgets/tab_order_pick_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cp_driver_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyBillPage extends GetView<MyBillController> {
  const MyBillPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyBillController>(
      id: "myOrder",
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0XFFF9F9F9),
          appBar: AppBar(
            title: const Text("我的账单"),
            bottom: TabBar(
              controller: controller.tabController,
              tabs: controller.tabsName.map((e) => Tab(text: e)).toList(),
            ),
          ),
          body: Stack(
            children: [
              TabBarView(
                controller: controller.tabController,
                children: <Widget>[
                  KeepAliveWrapper(
                    child: StatusView<MyBillAllController>(
                      contentBuilder: (allController) { 
                        return SmartRefresher(
                          enablePullUp: true,
                          header: const RefreshHeader(),
                          footer: const RefreshFooter(),
                          controller: allController.refreshController,
                          onRefresh: allController.onRefresh,
                          onLoading: allController.onLoadMore,
                          child: ListView.separated(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return TabBillItem(
                                onCheck: (value) {
                                  print(value);
                                },
                                onTap: () {
                                  print('全部账单');
                                  Get.toNamed(Routes.myOrderSigned);
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 5.h);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  KeepAliveWrapper(
                    child: StatusView<MyBillToPaidController>(
                      contentBuilder: (toPaidController) {
                        return SmartRefresher(
                          enablePullUp: true,
                          header: const RefreshHeader(),
                          footer: const RefreshFooter(),
                          controller: toPaidController.refreshController,
                          onRefresh: toPaidController.onRefresh,
                          onLoading: toPaidController.onLoadMore,
                          child: ListView.builder(
                            itemCount: toPaidController.dataSource.length,
                            itemBuilder: (context, index) {
                              return TabOrderPaidItem(
                                onTap: () {
                                  print('待支付被点击');
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
                    child: StatusView<MyBillPaidController>(
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
                              return TabOrderPicUpkItem(
                                onTap: () {
                                  print('已经支付');
                                  Get.toNamed(Routes.myOrderPickUp);
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  KeepAliveWrapper(
                    child: StatusView<MyBillOverdueController>(
                      contentBuilder: (overduceController) {
                        return SmartRefresher(
                          enablePullUp: true,
                          header: const RefreshHeader(),
                          footer: const RefreshFooter(),
                          controller: overduceController.refreshController,
                          onRefresh: overduceController.onRefresh,
                          onLoading: overduceController.onLoadMore,
                          child: ListView.builder(
                            itemCount: overduceController.dataSource.length,
                            itemBuilder: (context, index) {
                              return TabOrderFulfillmentItem(
                                onTap: () {
                                  print('已逾期');
                                  Get.toNamed(Routes.myOrderFulfillment);
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
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: true,
                              onChanged: (value) {}),
                          Text("全选"),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "总计：100元",
                            style: TextStyle(
                                color: const Color(0XFF323232),
                                fontSize: 12.sp),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.find<MyBillAllController>().toPayPage();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 33.w),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15.r)),
                              child: Text(
                                "支付",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
