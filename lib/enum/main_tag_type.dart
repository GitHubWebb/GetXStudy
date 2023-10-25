import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cp_driver_app/enum/tag_type.dart';

import 'package:cp_driver_app/pages/home/view/home_page.dart';
import 'package:cp_driver_app/pages/my/view/my_page.dart';
import 'package:cp_driver_app/pages/tree/view/tabs_page.dart';
import 'package:cp_driver_app/pages/tree/view/tree_page.dart';
import 'package:cp_driver_app/resource/assets_image_constant.dart';

// enum MainTagType { home, project, publicNumber, tree, my }
enum MainTagType { home, tree, my }

extension MainTagTypeExt on MainTagType {
  Map<String, dynamic> get icon {
    switch (this) {
      case MainTagType.home:
        // return Icons.home;
        return {
          "normal": AssetsImageConstant.homeBarNor,
          "actived": AssetsImageConstant.homeBarActive
        };
      // case MainTagType.project:
      //   return Icons.web;
      // case MainTagType.publicNumber:
      //   return Icons.public;
      case MainTagType.tree:
        // return Icons.list;
        return {
          "normal": AssetsImageConstant.treeBarNor,
          "actived": AssetsImageConstant.treeBarActive
        };
      case MainTagType.my:
        // return Icons.person;
        return {
          "normal": AssetsImageConstant.myBarNor,
          "actived": AssetsImageConstant.myBarActive
        };
    }
  }

  String get title {
    switch (this) {
      case MainTagType.home:
        return "首页";
      // case MainTagType.project:
      //   return "项目";
      // case MainTagType.publicNumber:
      // return "公众号";
      case MainTagType.tree:
        return "消息";
      case MainTagType.my:
        return "我的";
    }
  }

  Widget get page {
    switch (this) {
      case MainTagType.home:
        return const HomePage();
      // case MainTagType.project:
      //   return const TabsPage(type: TagType.project);
      // case MainTagType.publicNumber:
      //   return const TabsPage(type: TagType.publicNumber);
      case MainTagType.tree:
        return const TreePage();
      case MainTagType.my:
        return const MyPage();
    }
  }

  static List<BottomNavigationBarItem> get items {
    return MainTagType.values
        .map(
          (type) => BottomNavigationBarItem(
            // icon: Icon(type.icon),
            icon: Container(
              padding: EdgeInsets.only(top: 6.5.h),
              child: Image.asset(
                type.icon['normal'],
                width: 21.5.w,
                height: 21.h,
              ),
            ),
            activeIcon: Container(
              padding: EdgeInsets.only(top: 6.5.h),
              child: Image.asset(
                type.icon["actived"],
                width: 21.5.w,
                height: 21.h,
              ),
            ),
            label: type.title,
          ),
        )
        .toList();
  }
}
