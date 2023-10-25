import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:cp_driver_app/account_manager/account_manager.dart';
import 'package:cp_driver_app/base/base_request_controller.dart';
import 'package:cp_driver_app/base/resign_first_responder.dart';
import 'package:cp_driver_app/entity/account_info_entity.dart';
import 'package:cp_driver_app/pages/my/controller/get_user_info_mixin.dart';
import 'package:cp_driver_app/pages/my/repository/my_repository.dart';
import 'package:cp_driver_app/logger/logger.dart';

class LoginController
    extends BaseRequestController<MyRepository, AccountInfoEntity>
    with GetUserInfoMixin {
  final userNameTextFiledController = TextEditingController(text: "");

  final passwordTextFiledController = TextEditingController(text: "");

  final userNameIsNotEmpty = false.obs;

  final passwordIsNotEmpty = false.obs;

  final obscureText = true.obs;

  @override
  void onInit() {
    super.onInit();
    logger.d("onInit");
  }

  void login({required String username, required String password}) async {
    ResignFirstResponder.unfocus();
    final response =
        await request.login(username: username, password: password);

    String message;
    if (response.isSuccess == true && response.data != null) {
      await AccountManager()
          .save(info: response.data!, isLogin: true, password: password);
      await getUserCoinInfo();
      message = "登录成功";
    } else {
      message = "登录失败";
    }

    /// 在这里可以跳转
    // Get.back();
    // return;
    Get.snackbar(
      "",
      message,
      duration: const Duration(seconds: 1),
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) {
          /// 在这里不能跳转,目前还没找到原因
          // Get.back();
          if (response.isSuccess) {
            final params = {
              "isLogin": AccountManager().isLogin,
              "userInfo": userInfo,
            };
            navigator?.pop(params);
          }
          // navigator?.popUntil(
          //   (route) => route.settings.name == Routes.main,
          // );
        }
      },
    );
  }
}
