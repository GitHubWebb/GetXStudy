import 'package:cp_driver_app/pages/my/controller/my_order_%20canceled_controller.dart';
import 'package:cp_driver_app/pages/my/widgets/detail_contaienr_cell.dart';
import 'package:cp_driver_app/pages/my/widgets/detail_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderDetailCanceledPage extends GetView<MyOrderCanceledController> {
  const OrderDetailCanceledPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单详情'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 30.h,
                decoration: const BoxDecoration(color: Colors.white),
                child: Align(
                  child: Text(
                    "已取消",
                    style: TextStyle(
                        fontSize: 12.sp, color: const Color(0XFFFF0000)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0XFFF9F9F9),
                ),
                // 订单号-> 车辆信息 ->商品信息 ->业务信息
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: const Text(
                        '订单编号：202307311516230002',
                        style: TextStyle(color: Color(0XFF323232)),
                      ),
                    ),

                    // ---------- 车辆信息
                    DetailContainerCell(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DetailLabelWidget(label: "车辆信息"),
                          SizedBox(height: 10.h),
                          const Text("奇瑞-艾瑞泽E-2021款 智行版"),
                          SizedBox(height: 10.h),
                          const Text("车牌号：--"),
                          SizedBox(height: 10.h),
                          const Text("VIN：--")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // ------- 商品信息
                    DetailContainerCell(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DetailLabelWidget(label: "商品信息"),
                          SizedBox(height: 10.h),
                          const Text("期数：3期"),
                          SizedBox(height: 10.h),
                          const Text("月租：3700.00元"),
                          SizedBox(height: 10.h),
                          const Text("定金：500.00元"),
                          SizedBox(height: 10.h),
                          const Text("押金：10000.00元"),
                          SizedBox(height: 10.h),
                          const Text("提前终止违约金比例：20%"),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // ------- 业务信息
                    DetailContainerCell(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DetailLabelWidget(label: "业务信息"),
                          SizedBox(height: 10.h),
                          const Text("下单时间：2023-09-01 10:11:39"),
                          SizedBox(height: 10.h),
                          const Text("实际交车日期：--"),
                          SizedBox(height: 10.h),
                          const Text("预计结束日期：--"),
                          SizedBox(height: 10.h),
                          const Text("实际结束日期：--"),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 15.h, right: 12.w, bottom: 10.h),
                      child: const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            '已付定金：500.00元',
                            style: TextStyle(color: Color(0XFFFF0000)),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
