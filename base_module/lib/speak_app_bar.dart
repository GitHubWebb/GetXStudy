import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 顶部AppBar
class SpeakAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;

  /// 是否显示返回按钮
  final bool leading;
  final leadingAction;

  final bool transparent;

  ///右侧Widgets
  final List<Widget>? actions;
  // 自定义title
  final Widget? titleCoust;

  final Color backgroundColor;

  final double? frontSize;

  final Color frontColor;

  final Color backIconColor;

  const SpeakAppBar({
    Key? key,
    required this.title,
    this.titleCoust,
    this.actions,
    this.leading = false,
    this.leadingAction,
    this.backgroundColor = const Color(0xFFCFE7F4),
    this.transparent = false,
    this.frontSize = null,
    this.frontColor = const Color(0xff2E2E2E),
    this.backIconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: Platform.isIOS ? null :
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent, // 设置状态栏颜色为透明
      ),
      leading: leading
          ? IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: backIconColor,
        ),
        onPressed: () {
          if (leadingAction == null) {
            Navigator.of(context).pop(true);
          } else {
            leadingAction();
          }
        },
      )
          : null,
      title: titleCoust ??
          Text(
            title,
            style: TextStyle(
              fontSize: frontSize ?? 18.sp,
              color: frontColor,
              letterSpacing: 1.0,
            ),
          ),
      actions: actions,
      backgroundColor: transparent ? Colors.transparent : backgroundColor,
      centerTitle: true,
      elevation: 0,
    );
  }
}
