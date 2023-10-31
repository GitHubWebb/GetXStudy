import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailLabelWidget extends StatelessWidget {
  final String label;
  const DetailLabelWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        Container(
          width: 50.w,
          height: 5.h,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5.r)),
        ),
      ],
    );
  }
}
