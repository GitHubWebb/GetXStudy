import 'package:cp_driver_app/base/base_request_controller.dart';
import 'package:cp_driver_app/logger/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../routes/routes.dart';
import '../widgets/PayRadioOption.dart';

/**
 * desc  : 选择支付方式 Controller
 * author: wangwx
 * date  : 2023-11-01
 */
class SelectPayDialogController extends BaseRequestController {
  @override
  void onInit() {
    super.onInit();
  }

  //<editor-fold desc="显示选择支付方式弹框">
  /// 显示选择支付方式弹框
  void showSelectPayDialog(context) {
    //target widget
    SmartDialog.show(
        keepSingle: true,
        alignment: Alignment.bottomCenter,
        builder: (_) {
          return Container(
            width: double.infinity,
            height: 286.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                titleRightContainer(),
                titleTipContainer(),
                payContentContainer(),
                InkWell(
                  onTap: () => {
                    SmartDialog.showToast("支付成功~"),
                    showPaySuccessDialog(context)
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Align(
                        child: Text(
                      '立即支付定金¥500.00',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () => SmartDialog.dismiss(),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    decoration: BoxDecoration(
                        color: const Color(0XFFD4D4D4),
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Align(
                        child: Text(
                      '取消支付',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          );
        });
  }

  //</editor-fold>

  //<editor-fold desc="显示选择支付方式弹框">
  /// 显示支付成功弹框
  void showPaySuccessDialog(context) {
    //target widget
    SmartDialog.show(
        keepSingle: true,
        alignment: Alignment.bottomCenter,
        builder: (_) {
          return Container(
            width: double.infinity,
            height: 286.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
            ),
            child: Column(
              children: [
                titleSuccessTipContainer(),
                paySuccessContentContainer(context),
                Spacer(),
                GestureDetector(
                  onTap: () => {
                    SmartDialog.dismiss(),
                    Get.offAllNamed(Routes.main),
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 30.h, horizontal: 10.w),
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Align(
                        child: Text(
                      '逛一逛',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          );
        });
  }

  //</editor-fold>

  //<editor-fold desc="顶部标题">
  /// 顶部标题右侧容器
  Widget titleRightContainer() {
    return Container(
      margin: EdgeInsets.only(top: 16.h, right: 15.w),
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () => SmartDialog.showToast("点击取消规则"),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 5.w),
              child: Text(
                "取消规则",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xFF6D6D6D),
                ),
              ),
            ),
            Image.asset(
              Assets.payIcQuestionMarkRing,
              width: 13.w,
              height: 13.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  /// 标题文案
  Widget titleTipContainer() {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      alignment: Alignment.center,
      child: Text(
        "选择支付方式",
        style: TextStyle(
          fontSize: 15.sp,
          color: Color(0xFF6D6D6D),
        ),
      ),
    );
  }

  /// 支付成功标题文案
  Widget titleSuccessTipContainer() {
    return Container(
      margin: EdgeInsets.only(top: 44.h),
      alignment: Alignment.center,
      child: Text(
        "支付成功",
        style: TextStyle(
          fontSize: 15.sp,
          color: Color(0xFF6D6D6D),
        ),
      ),
    );
  }

  //</editor-fold>

  //<editor-fold desc="支付View内容">
  // 定义ValueNotifier<int> 对象 _counter
  final ValueNotifier<int> _payGroupValue = ValueNotifier<int>(0);

  ///单选框的成组使用
  ValueListenableBuilder<int> payContentContainer() {
    return ValueListenableBuilder<int>(
        valueListenable: _payGroupValue,
        builder: (context, value, _) {
          return Container(
            margin: EdgeInsets.only(top: 20.h, bottom: 21.h),
            width: double.infinity,
            child: Column(
              children: [
                PayRadioOption<int>.initPayType(Assets.payIcWechat, "微信支付",
                    Assets.payIcNormalRadio, Assets.payIcSelectRadio,
                    value: 0, groupValue: _payGroupValue.value, onChanged: (v) {
                  _payGroupValue.value = v as int;
                }),
                PayRadioOption<int>.initPayType(Assets.payIcAlipay, "支付宝支付",
                    Assets.payIcNormalRadio, Assets.payIcSelectRadio,
                    value: 1, groupValue: _payGroupValue.value, onChanged: (v) {
                  _payGroupValue.value = v as int;
                }),
              ],
            ),
          );
        });
  }

//</editor-fold>

  //<editor-fold desc="支付成功View">
  /// 支付成功内容View
  Widget paySuccessContentContainer(context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.h, bottom: 7.h),
            // alignment: Alignment.center,
            child: Text(
              "¥500.00",
              style: TextStyle(
                fontSize: 30.sp,
                color: Color(0xFF6D6D6D),
              ),
            ),
          ),
          InkWell(
            onTap: () => {
              SmartDialog.dismiss(),
              Get.toNamed(Routes.myOrder),
            },
            child: Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "查看订单",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
//</editor-fold>
}
