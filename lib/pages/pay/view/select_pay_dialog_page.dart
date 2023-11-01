import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../controller/select_pay_dialog_controller.dart';

/**
 * desc  : 选择支付方式 dialog弹框
 * author: wangwx
 * date  : 2023-11-01
 */
class SelectPayDialogPage extends GetView<SelectPayDialogController> {
  const SelectPayDialogPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // return Container(child:_bindPage(context)),
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('SmartDialog-EasyDemo')),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Wrap(spacing: 20, children: [
        ]),
      ),
    );
  }

  void _bindPage(BuildContext ctx) {
    //target widget
    SmartDialog.show(builder: (_) {
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
            Navigator.push(ctx, MaterialPageRoute(builder: (_) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("New Page"),
                ),
                body: const Center(child: Text("New Page")),
              );
            }));
          },
          child: const Text('to new page'),
        ),
      );
    });
  }

}