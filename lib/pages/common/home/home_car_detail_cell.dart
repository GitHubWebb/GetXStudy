import 'package:cp_driver_app/logger/logger.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * desc  : 车辆详情页面item
 * author: wangwx
 * date  : 2023-10-26
 */
class HomeCarDetailCell extends StatelessWidget {
  final int _position;
  final int _itemCount;
  final bool _isFirstPosition;
  final bool _isLastPosition;
  final ArticleInfoDatas _model;

  final ValueChanged<ArticleInfoDatas> _cellTapCallback;

  const HomeCarDetailCell(
      {Key? key,
      required int position,
      required int itemCount,
      required ArticleInfoDatas model,
      required ValueChanged<ArticleInfoDatas> callback})
      : _position = position,
        _itemCount = itemCount,
        _isFirstPosition = (position == 0),
        _isLastPosition = (position == (itemCount - 1)),
        _model = model,
        _cellTapCallback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _cellTapCallback(_model);
      },
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                  left: 9, right: 10, bottom: (_isLastPosition ? 19 : 0)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_isFirstPosition ? 10 : 0),
                  topRight: Radius.circular(_isFirstPosition ? 10 : 0),
                  bottomLeft: Radius.circular(_isLastPosition ? 10 : 0),
                  bottomRight: Radius.circular(_isLastPosition ? 10 : 0),
                ),
                // shape: BoxShape.circle,
                // 阴影的颜色，模糊半径
                boxShadow: [
                  BoxShadow(
                    color: Color(0XFFD7D7D7),
                    blurRadius: _isFirstPosition || _isLastPosition ? 1 : 0,
                  )
                ],
              ),
              child: _getContent(context)),
        ],
      ),
    );
  }

  Widget _getContent(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: _isFirstPosition,
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 14, bottom: 13),
              child: Column(
                children: [
                  Text(
                    "选择价格方案",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xFF323232),
                    ),
                  ),
                  Container(
                    width: 71.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  )
                ],
              ),
            )),
        Container(
          margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 14.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border(
              top: BorderSide(width: 1.0, color: Color(0XFFEDEDED)),
              left: BorderSide(width: 1.0, color: Color(0XFFEDEDED)),
              right: BorderSide(width: 1.0, color: Color(0XFFEDEDED)),
              bottom: BorderSide(width: 1.0, color: Color(0XFFEDEDED)),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _leftContentView(),
              _contentView(context),
            ],
          ),
        ),
        // const Divider(color: Colors.red,),
      ],
    );
  }

  Widget _leftContentView() {
    return Container(
      width: 40.w,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        left: 15,
        top: 29,
        right: 33,
        // bottom: 14,
      ),
      child: Text(
        "${_position + 1}期",
        style: TextStyle(
          color: Color(0XFF323232),
          fontSize: 14.sp,
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _contentView(context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          top: 17,
          right: 12,
          bottom: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "¥",
                  style:
                      TextStyle(color: Color(0XFF323232), fontSize: 10.sp),
                ),
                Text(
                  "3700.00",
                  style:
                      TextStyle(color: Color(0XFF323232), fontSize: 14.sp),
                ),
                Text(
                  "/月",
                  style:
                      TextStyle(color: Color(0XFF323232), fontSize: 12.sp),
                ),
                const Spacer(),
                Text(
                  "查看详情",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 12.sp),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "¥",
                    style:
                        const TextStyle(color: Color(0XFF323232), fontSize: 10),
                  ),
                  Text(
                    "10000.00 ",
                    style:
                        TextStyle(color: Color(0XFF323232), fontSize: 14.sp),
                  ),
                  Text(
                    "押金",
                    style:
                        TextStyle(color: Color(0XFF323232), fontSize: 12.sp),
                  ),
                  const Spacer(),
                  Text(
                    "提前终止违约金比例 20%",
                    style:
                        const TextStyle(color: Color(0XFFB0B0B0), fontSize: 9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
