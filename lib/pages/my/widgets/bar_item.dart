import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarItemWidget extends StatelessWidget {
  final String title;
  final String imgPath;

  const BarItemWidget({Key? key, required this.title, required this.imgPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imgPath,
          width: 33.w,
          height: 33.h,
        ),
        SizedBox(height: 6.5.h),
        Text(title)
      ],
    );
  }
}
