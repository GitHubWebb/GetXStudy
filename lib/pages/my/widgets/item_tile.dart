import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class item_tile extends StatelessWidget {
  final Function() widgetCallBack;
  final String title;
  final String sub;
  const item_tile({
    super.key,
    required this.title,
    required this.widgetCallBack,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0XFF323232),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widgetCallBack,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 50.w,
                  ),
                  child: Row(
                    children: [
                      Text(sub),
                      SizedBox(
                        width: 20.w,
                      ),
                      const Icon(
                        Icons.chevron_right_outlined,
                        color: Color(0XFF323232),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
