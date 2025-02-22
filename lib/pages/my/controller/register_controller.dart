import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:cp_driver_app/account_manager/account_manager.dart';
import 'package:cp_driver_app/base/resign_first_responder.dart';
import 'package:cp_driver_app/pages/my/controller/login_controller.dart';
import 'package:cp_driver_app/logger/logger.dart';

class RegisterController extends LoginController {
  final rePasswordTextFiledController = TextEditingController(text: "");

  final password = "".obs;

  final rePassword = "".obs;

  final reObscureText = true.obs;

  @override
  void onInit() {
    super.onInit();
    logger.d("onInit");
  }

  void register(
      {required String username,
      required String password,
      required String rePassword}) async {
    ResignFirstResponder.unfocus();
    final response = await request.register(
        username: username, password: password, rePassword: rePassword);

    String message;
    if (response.isSuccess == true && response.data != null) {
      await AccountManager()
          .save(info: response.data!, isLogin: true, password: password);
      await getUserCoinInfo();
      message = "注册成功";
    } else {
      message = "注册失败";
    }
    Get.snackbar(
      "",
      message,
      duration: const Duration(seconds: 1),
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) {
          if (response.isSuccess) {
            Future.delayed(
              const Duration(seconds: 0),
              () => navigator?.pop(AccountManager().isLogin),
            );
          }
        }
      },
    );
  }

  bool get isShowRegisterButton =>
      (userNameIsNotEmpty.value &&
          password.value.isNotEmpty &&
          rePassword.value.isNotEmpty) &&
      (password == rePassword);
}
