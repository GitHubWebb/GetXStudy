import 'package:get/get.dart';

import 'package:getx_study/account_manager/account_manager.dart';
import 'package:getx_study/base/resign_first_responder.dart';
import 'package:getx_study/pages/my/controller/login_controller.dart';
import 'package:getx_study/logger/logger.dart';

class RegisterController extends LoginController {

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
}