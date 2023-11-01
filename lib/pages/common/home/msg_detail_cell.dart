import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * desc  : 消息页面item
 * author: wangwx
 * date  : 2023-10-27
 */
class MsgDetailCell extends StatelessWidget {
  final int _position;
  final int _itemCount;
  final bool _isFirstPosition;
  final bool _isLastPosition;
  final ArticleInfoDatas _model;

  final ValueChanged<ArticleInfoDatas> _cellTapCallback;

  const MsgDetailCell(
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
    return InkWell(
      onTap: () {
        _cellTapCallback(_model);
      },
      child: Container(
          margin: EdgeInsets.all(0.0),
          color: const Color(0XFFF9F9F9),
          child: _getContent()),
    );
  }

  Widget _getContent() {
    return Container(
      margin: EdgeInsets.only(
          left: 10, top: _isFirstPosition ? 10 : 0, right: 10, bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        // 阴影的颜色，模糊半径
        boxShadow: [
          BoxShadow(
            color: Color(0XFFD7D7D7),
            blurRadius: _isFirstPosition || _isLastPosition ? 1 : 0,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _contentView(),
        ],
      ),
    );
  }

  Widget _contentView() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          left: 14,
          top: 14,
          right: 13,
          bottom: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // crossAxisAlignment: CrossAxisAlignment.center,
            Text(
              "尊敬的用户：",
              style: TextStyle(color: Color(0XFF1B1B1B), fontSize: 10.sp),
            ),
            Container(
              margin: EdgeInsets.only(left: 1, top: 9),
              child: Text(
                "【第一期租金】应收3700.00元，已收到1240.00元，剩余2460.00元，请及时缴纳剩余租金。",
                style: TextStyle(color: Color(0XFF1B1B1B), fontSize: 14.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 18),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    "2023-09-21 10::35:25",
                    style: TextStyle(color: Color(0XFF1B1B1B), fontSize: 10.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
