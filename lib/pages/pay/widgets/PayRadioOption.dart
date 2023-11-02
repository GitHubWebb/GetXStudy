import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * desc  : 支付 单选按钮
 * author: wangwx
 * date  : 2023-11-02
 */
class PayRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final Widget textWidget;
  final Widget normalLabelWidget;
  final Widget selectLabelWidget;
  final ValueChanged<T?> onChanged;

  const PayRadioOption({
    required this.value,
    required this.groupValue,
    required this.textWidget,
    required this.normalLabelWidget,
    required this.selectLabelWidget,
    required this.onChanged,
  });

  PayRadioOption.initPayType(
    String iconAssets,
    String text,
    String normalAssets,
    String selectAssets, {
    required this.value,
    required this.groupValue,
    required this.onChanged,
  })  : this.textWidget = _leftText(iconAssets, text),
        this.normalLabelWidget = _rightRadio(normalAssets),
        this.selectLabelWidget = _rightRadio(selectAssets);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 14.h, right: 15.w),
      width: double.infinity,
      child: InkWell(
        onTap: () => onChanged(value),
        child: Row(
          children: [
            _buildText(),
            Spacer(),
            _buildLabel(),
          ],
        ),
      ),
    );
  }

  Widget _buildText() {
    return textWidget;
  }

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;
    return isSelected ? selectLabelWidget : normalLabelWidget;
  }

  /// 左侧文字
  static Widget _leftText(String iconAssets, String text) {
    return Row(
      children: [
        Image.asset(
          iconAssets,
          width: 25.w,
          height: 25.h,
          fit: BoxFit.contain,
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: Color(0xFF6D6D6D),
            ),
          ),
        ),
      ],
    );
  }

  /// 右侧Radio
  static Widget _rightRadio(String radioAssets) {
    return Image.asset(
      radioAssets,
      width: 15.w,
      height: 15.h,
      fit: BoxFit.contain,
    );
  }
}
