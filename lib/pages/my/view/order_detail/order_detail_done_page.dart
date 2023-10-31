/*
 * @Author: 米亚流年 miyaliunian@gmail.com
 * @Date: 2023-10-31 14:14:32
 * @LastEditors: 米亚流年 miyaliunian@gmail.com
 * @LastEditTime: 2023-10-31 14:20:18
 * @FilePath: /cp_driver_app/lib/pages/my/view/order_detail/order_detail_signed_page.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:cp_driver_app/pages/my/controller/my_order_done_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailDonePage extends GetView<MyOrderDoneController> {
  const OrderDetailDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('待签约详情页'),
    );
  }
}
