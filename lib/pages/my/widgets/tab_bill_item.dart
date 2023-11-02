import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBillItem extends StatelessWidget {
  final Function()? onTap;
  final Function(bool?)? onCheck;
  const TabBillItem({super.key, this.onTap, this.onCheck});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: const Color(0XFFD7D7D7),
                offset: Offset(0, 2.h),
                spreadRadius: 0,
                blurRadius: 10)
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Radio(value: false, groupValue: true, onChanged: onCheck),
              const Text("订单编号：202307311516230002")
            ],
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 15.w),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "第2期租金账单",
                  style: TextStyle(
                      color: Color(0XFF323232), fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "还款周期：2023-11-15 至 2023-12-14",
                      style: TextStyle(color: Color(0XFF6D6D6D)),
                    ),
                    Icon(
                      Icons.chevron_right_outlined,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    const Text(
                      "应收：3700.00元",
                      style: TextStyle(color: Color(0XFF6D6D6D)),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    const Text(
                      "应收：3700.00元",
                      style: TextStyle(color: Color(0XFFFF0000)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
