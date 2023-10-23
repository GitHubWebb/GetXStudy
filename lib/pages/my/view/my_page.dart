// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_study/account_manager/account_manager.dart';
import 'package:getx_study/enum/my.dart' as my;
import 'package:getx_study/pages/my/controller/my_controller.dart';
import 'package:getx_study/resource/assets_image_constant.dart';
import 'package:getx_study/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPage extends GetView<MyController> {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final statusBarHeight = ScreenUtil().statusBarHeight;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            image: AssetImage(
              AssetsImageConstant.myPageHeaderIcon,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 39.h, left: 16.5.w, right: 16.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  CircleAvatar(
                    radius: 30.r,
                    child: Image.asset(
                      AssetsImageConstant.defaultAvatar,
                    ),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "顾卓阳",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "个人信息管理",
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 18.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFD7D7D7).withAlpha(45),
                      offset: const Offset(1, 0),
                      blurRadius: 5,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "选项卡",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Image.asset(
                                AssetsImageConstant.myOrderIcon,
                                width: 33.5.w,
                                height: 33.5.h,
                              ),
                              SizedBox(height: 5.5.h),
                              Text("订单")
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Image.asset(
                                AssetsImageConstant.myBillIcon,
                                width: 33.5.w,
                                height: 33.5.h,
                              ),
                              SizedBox(height: 5.5.h),
                              Text("账单")
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Image.asset(
                                AssetsImageConstant.myCarChangeIcon,
                                width: 33.5.w,
                                height: 33.5.h,
                              ),
                              SizedBox(height: 5.5.h),
                              Text("申请换车")
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Image.asset(
                                AssetsImageConstant.mySettingIcon,
                                width: 33.5.w,
                                height: 33.5.h,
                              ),
                              SizedBox(height: 5.5.h),
                              Text("设置")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
