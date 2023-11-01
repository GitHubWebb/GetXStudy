import 'dart:math';

import 'package:cp_driver_app/base/base_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

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
  void showSelectPayDialog() {
    //target widget
    SmartDialog.show(
        // backDismiss: false,
        keepSingle: true,
        alignment: Alignment.bottomCenter,
        builder: (_) {
          return Container(
            height: 300,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                SmartDialog.showToast(
                    'test toast ---- ${Random().nextInt(999)}');
              },
              child: const Text('to new page'),
            ),
          );
        });
  }
//</editor-fold>
}
