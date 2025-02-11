import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/extension/string_extension.dart';

class InfoCell extends StatelessWidget {
  final ArticleInfoDatas _model;

  final ValueChanged<ArticleInfoDatas> _cellTapCallback;

  const InfoCell(
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
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 15, bottom: 10, right: 15),
        child: _getRow(),
      ),
    );
  }

  Widget _imageView() {
    return Visibility(
      visible: _model.envelopePic.toString().isNotEmpty,
      child: SizedBox(
        width: 60,
        height: 60,
        child: CachedNetworkImage(
          fit: BoxFit.fitHeight,
          imageUrl: _model.envelopePic.toString(),
          placeholder: (context, url) => Image.asset(
            "assets/images/placeholder.png",
          ),
        ),
      ),
    );
  }

  Widget _contentView() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _model.title.toString().replaceHtmlElement,
              style: const TextStyle(fontSize: 15),
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
                      visible: (_model.fresh ?? false),
                      child: const Text(
                        "最新 ",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Visibility(
                      visible: (_model.type != null && _model.type != 0),
                      child: const Text(
                        "置顶 ",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Visibility(
                      visible: ((_model.author.toString().isNotEmpty) ||
                          (_model.shareUser.toString().isNotEmpty)),
                      child: Text(
                        _model.author ?? _model.shareUser.toString(),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  _model.niceShareDate ?? "",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getRow() {
    return Column(
      children: [
        Row(
          children: <Widget>[
            _imageView(),
            _contentView(),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
