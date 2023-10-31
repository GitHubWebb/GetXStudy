import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailContainerCell extends StatelessWidget {
  final Widget content;
  const DetailContainerCell({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: const Color(0XFFD7D7D7),
                offset: Offset(0, 2.h),
                blurRadius: 10.r)
          ]),
      child: content,
    );
  }
}
