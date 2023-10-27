import 'package:cp_driver_app/logger/logger.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/extension/string_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * desc  : 车辆列表页面item
 * author: wangwx
 * date  : 2023-10-25
 */
class HomeCarInfoCell extends StatelessWidget {
  final ArticleInfoDatas _model;

  final ValueChanged<ArticleInfoDatas> _cellTapCallback;

  const HomeCarInfoCell(
      {Key? key,
      required ArticleInfoDatas model,
      required ValueChanged<ArticleInfoDatas> callback})
      : _model = model,
        _cellTapCallback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _cellTapCallback(_model);
      },
      child: Container(
          margin:
              const EdgeInsets.only(top: 15, left: 15, bottom: 0, right: 15),
          // color: Colors.blue,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            // shape: BoxShape.circle,
            // 阴影的颜色，模糊半径
            boxShadow: [BoxShadow(color: Color(0XFFD7D7D7), blurRadius: 1)],
          ),
          child: _getRow(context)),
    );
  }

  Widget _imageView() {
    // TODO 假数据
    _model.envelopePic =
        "https://cdn.photographylife.com/wp-content/uploads/2018/11/Moeraki-Boulders-New-Zealand.jpg";
    return Visibility(
      visible: _model.envelopePic.toString().isNotEmpty,
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          top: 21,
        ),
        child: SizedBox(
          width: 96,
          height: 65,
          child: CachedNetworkImage(
            fit: BoxFit.fitHeight,
            imageUrl: _model.envelopePic.toString(),
            placeholder: (context, url) => Image.asset(
              "assets/images/placeholder.png",
            ),
          ),
        ),
      ),
    );
  }

  Widget _contentView(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          left: 12,
          top: 17,
          right: 14,
          bottom: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _model.superChapterName.toString().replaceHtmlElement,
              style: const TextStyle(
                color: Color(0XFF323232),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Visibility(
                      visible: (_model.type != null && _model.type != 0),
                      child: const Text(
                        "车龄：",
                        style:
                            TextStyle(color: Color(0XFFB0B0B0), fontSize: 12),
                      ),
                    ),
                    Visibility(
                      visible: ((_model.author.toString().isNotEmpty) ||
                          (_model.shareUser.toString().isNotEmpty)),
                      child: Text(
                        _model.author ?? _model.shareUser.toString(),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style:
                            TextStyle(color: Color(0XFFB0B0B0), fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "¥",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 10),
                    ),
                    Text(
                      "3500/",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 17),
                    ),
                    Text(
                      "月起",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    _cellTapCallback(_model);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).primaryColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    //设置按钮的大小
                    minimumSize: MaterialStateProperty.all(Size(72, 29)),
                  ),
                  child: Text(
                    "查看详情",
                    style:
                        const TextStyle(color: Color(0XFFFCFCFC), fontSize: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getRow(context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _imageView(),
            _contentView(context),
          ],
        ),
        // const Divider(color: Colors.red,),
      ],
    );
  }
}
