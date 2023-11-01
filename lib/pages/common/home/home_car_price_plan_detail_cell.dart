import 'package:cp_driver_app/logger/logger.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../entity/car/price_plan_entity.dart';

/**
 * desc  : 价格方案详情页面item
 * author: wangwx
 * date  : 2023-10-31
 */
class PricePlanDetailCell extends StatelessWidget {
  final int _position;
  final int _itemCount;
  final bool _isFirstPosition;
  final bool _isLastPosition;
  final PricePlanEntity _model;

  final ValueChanged<PricePlanEntity> _cellTapCallback;

  const PricePlanDetailCell(
      {Key? key,
      required int position,
      required int itemCount,
      required PricePlanEntity model,
      required ValueChanged<PricePlanEntity> callback})
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
          margin: EdgeInsets.only(
              left: 0, right: 13, bottom: (_isLastPosition ? 0 : 0)),
          child: _contentView(context)),
    );
  }

  Widget _contentView(context) {
    return Container(
      margin: EdgeInsets.only(
        top: 0,
        // right: 13,
        bottom: _isLastPosition ? 19 : 12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${_model.name}",
            style:
                const TextStyle(color: Color(0XFF6D6D6D), fontSize: 11),
          ),
          Expanded(
            child: Text(
              "${_model.value ?? '--'}",
              style:
                  const TextStyle(color: Color(0XFF6D6D6D), fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
