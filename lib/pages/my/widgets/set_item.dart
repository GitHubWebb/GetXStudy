import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * desc  : 设置页面item
 * author: wangwx
 * date  : 2023-11-03
 */
class SetItemWidget extends StatelessWidget {
  final String title;
  final String? value;
  final Function onTap;

  const SetItemWidget(
      {Key? key, required this.title, required this.value, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        height: 40.h,
        margin: EdgeInsets.only(left: 10.w, top: 15.h, right: 10.w),
        padding: EdgeInsets.only(left: 16.w, right: 15.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFD7D7D7).withAlpha(45),
              offset: const Offset(1, 0),
              blurRadius: 5,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 11.sp, color: Color(0xFF323232)),
            ),
            Spacer(),
            value == null
                ? Container()
                : Text(
                    value!,
                    style: TextStyle(fontSize: 10.sp, color: Color(0xFF323232)),
                  ),
            Container(
              margin: EdgeInsets.only(left: 11.w),
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 11.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
