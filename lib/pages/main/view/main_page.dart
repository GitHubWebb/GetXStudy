import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_study/pages/home/view/home_page.dart';
import 'package:getx_study/pages/main/controller/main_controller.dart';
import 'package:getx_study/pages/my/view/my_page.dart';
import 'package:getx_study/pages/tree/view/tabs_page.dart';
import 'package:getx_study/pages/tree/view/tree_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: ((controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex,
            children: const [
              HomePage(),
              TabsPage(),
              TreePage(),
              MyPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "首页",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_contact_calendar),
                label: "项目",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "体系",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "我的",
              ),
            ],
            currentIndex: controller.selectedIndex, //默认选中的 index
            type: BottomNavigationBarType.fixed, //类型为 fixed
            onTap: controller.onItemTapped,
          ),
        );
      }),
    );
  }
}
