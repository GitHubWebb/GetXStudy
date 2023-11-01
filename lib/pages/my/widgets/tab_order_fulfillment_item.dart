import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabOrderFulfillmentItem extends StatelessWidget {
  final Function()? onTap;
  const TabOrderFulfillmentItem({super.key, this.onTap});

  @override
  Widget build(Object context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 12.w, top: 9.h, right: 12.w, bottom: 4.5.h),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.w, top: 15.h, right: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("订单编号：202307311516230002"),
                    SizedBox(
                      height: 19.h,
                    ),
                    const Text("奇瑞-艾瑞泽E-2021款 智行版"),
                    SizedBox(height: 9.h),
                    const Text("月租：3700.00元"),
                    SizedBox(height: 9.h),
                    const Text("租期：3期"),
                    SizedBox(height: 10.h),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                          width: 0.5, color: const Color(0XFF3FCD00))),
                  child: const Text(
                    '履约中',
                    style: TextStyle(color: Color(0XFF3FCD00)),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 15.w, bottom: 15.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          '应付3期租金总额：11000.00元',
                          style: TextStyle(
                              color: Color(0XFF323232), fontSize: 10.sp),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          '实付1期租金总额：3700.00元',
                          style: TextStyle(
                              color: Color(0XFFFF0000), fontSize: 10.sp),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(width: 0.5)),
                        child: Text(
                          '查看详情',
                          style: TextStyle(
                            color: const Color(0XFF6D6D6D),
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
