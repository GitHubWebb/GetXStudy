import 'package:cp_driver_app/entity/article_info_entity.dart';
import 'package:cp_driver_app/generated/json/base/json_convert_content.dart';

import '../../base/interface.dart';

ArticleInfoEntity $ArticleInfoEntityFromJson(Map<String, dynamic> json) {
  final ArticleInfoEntity articleInfoEntity = ArticleInfoEntity();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    articleInfoEntity.curPage = curPage;
  }
  final List<ArticleInfoDatas>? datas = (json['datas'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ArticleInfoDatas>(e) as ArticleInfoDatas)
      .toList();
  if (datas != null) {
    articleInfoEntity.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    articleInfoEntity.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    articleInfoEntity.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    articleInfoEntity.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    articleInfoEntity.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    articleInfoEntity.total = total;
  }
  return articleInfoEntity;
}

Map<String, dynamic> $ArticleInfoEntityToJson(ArticleInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['curPage'] = entity.curPage;
  data['datas'] = entity.datas?.map((v) => v.toJson()).toList();
  data['offset'] = entity.offset;
  data['over'] = entity.over;
  data['pageCount'] = entity.pageCount;
  data['size'] = entity.size;
  data['total'] = entity.total;
  return data;
}

extension ArticleInfoEntityExtension on ArticleInfoEntity {
  ArticleInfoEntity copyWith({
    int? curPage,
    List<ArticleInfoDatas>? datas,
    int? offset,
    bool? over,
    int? pageCount,
    int? size,
    int? total,
  }) {
    return ArticleInfoEntity()
      ..curPage = curPage ?? this.curPage
      ..datas = datas ?? this.datas
      ..offset = offset ?? this.offset
      ..over = over ?? this.over
      ..pageCount = pageCount ?? this.pageCount
      ..size = size ?? this.size
      ..total = total ?? this.total;
  }
}

ArticleInfoDatas $ArticleInfoDatasFromJson(Map<String, dynamic> json) {
  final ArticleInfoDatas articleInfoDatas = ArticleInfoDatas();
  final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
  if (apkLink != null) {
    articleInfoDatas.apkLink = apkLink;
  }
  final int? audit = jsonConvert.convert<int>(json['audit']);
  if (audit != null) {
    articleInfoDatas.audit = audit;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    articleInfoDatas.author = author;
  }
  final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
  if (canEdit != null) {
    articleInfoDatas.canEdit = canEdit;
  }
  final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
  if (chapterId != null) {
    articleInfoDatas.chapterId = chapterId;
  }
  final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
  if (chapterName != null) {
    articleInfoDatas.chapterName = chapterName;
  }
  final bool? collect = jsonConvert.convert<bool>(json['collect']);
  if (collect != null) {
    articleInfoDatas.collect = collect;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    articleInfoDatas.courseId = courseId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    articleInfoDatas.desc = desc;
  }
  final String? descMd = jsonConvert.convert<String>(json['descMd']);
  if (descMd != null) {
    articleInfoDatas.descMd = descMd;
  }
  final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
  if (envelopePic != null) {
    articleInfoDatas.envelopePic = envelopePic;
  }
  final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
  if (fresh != null) {
    articleInfoDatas.fresh = fresh;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    articleInfoDatas.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    articleInfoDatas.link = link;
  }
  final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
  if (niceDate != null) {
    articleInfoDatas.niceDate = niceDate;
  }
  final String? niceShareDate =
      jsonConvert.convert<String>(json['niceShareDate']);
  if (niceShareDate != null) {
    articleInfoDatas.niceShareDate = niceShareDate;
  }
  final String? origin = jsonConvert.convert<String>(json['origin']);
  if (origin != null) {
    articleInfoDatas.origin = origin;
  }
  final String? prefix = jsonConvert.convert<String>(json['prefix']);
  if (prefix != null) {
    articleInfoDatas.prefix = prefix;
  }
  final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
  if (projectLink != null) {
    articleInfoDatas.projectLink = projectLink;
  }
  final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
  if (publishTime != null) {
    articleInfoDatas.publishTime = publishTime;
  }
  final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
  if (selfVisible != null) {
    articleInfoDatas.selfVisible = selfVisible;
  }
  final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
  if (shareDate != null) {
    articleInfoDatas.shareDate = shareDate;
  }
  final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
  if (shareUser != null) {
    articleInfoDatas.shareUser = shareUser;
  }
  final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
  if (superChapterId != null) {
    articleInfoDatas.superChapterId = superChapterId;
  }
  final String? superChapterName =
      jsonConvert.convert<String>(json['superChapterName']);
  if (superChapterName != null) {
    articleInfoDatas.superChapterName = superChapterName;
  }
  final List<ArticleInfoDatasTags>? tags = (json['tags'] as List<dynamic>?)
      ?.map((e) =>
          jsonConvert.convert<ArticleInfoDatasTags>(e) as ArticleInfoDatasTags)
      .toList();
  if (tags != null) {
    articleInfoDatas.tags = tags;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    articleInfoDatas.title = title;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    articleInfoDatas.type = type;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    articleInfoDatas.userId = userId;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    articleInfoDatas.visible = visible;
  }
  final int? zan = jsonConvert.convert<int>(json['zan']);
  if (zan != null) {
    articleInfoDatas.zan = zan;
  }
  final int? originId = jsonConvert.convert<int>(json['originId']);
  if (originId != null) {
    articleInfoDatas.originId = originId;
  }
  return articleInfoDatas;
}

Map<String, dynamic> $ArticleInfoDatasToJson(ArticleInfoDatas entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['apkLink'] = entity.apkLink;
  data['audit'] = entity.audit;
  data['author'] = entity.author;
  data['canEdit'] = entity.canEdit;
  data['chapterId'] = entity.chapterId;
  data['chapterName'] = entity.chapterName;
  data['collect'] = entity.collect;
  data['courseId'] = entity.courseId;
  data['desc'] = entity.desc;
  data['descMd'] = entity.descMd;
  data['envelopePic'] = entity.envelopePic;
  data['fresh'] = entity.fresh;
  data['id'] = entity.id;
  data['link'] = entity.link;
  data['niceDate'] = entity.niceDate;
  data['niceShareDate'] = entity.niceShareDate;
  data['origin'] = entity.origin;
  data['prefix'] = entity.prefix;
  data['projectLink'] = entity.projectLink;
  data['publishTime'] = entity.publishTime;
  data['selfVisible'] = entity.selfVisible;
  data['shareDate'] = entity.shareDate;
  data['shareUser'] = entity.shareUser;
  data['superChapterId'] = entity.superChapterId;
  data['superChapterName'] = entity.superChapterName;
  data['tags'] = entity.tags?.map((v) => v.toJson()).toList();
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['userId'] = entity.userId;
  data['visible'] = entity.visible;
  data['zan'] = entity.zan;
  data['originId'] = entity.originId;
  return data;
}

extension ArticleInfoDatasExtension on ArticleInfoDatas {
  ArticleInfoDatas copyWith({
    String? apkLink,
    int? audit,
    String? author,
    bool? canEdit,
    int? chapterId,
    String? chapterName,
    bool? collect,
    int? courseId,
    String? desc,
    String? descMd,
    String? envelopePic,
    bool? fresh,
    int? id,
    String? link,
    String? niceDate,
    String? niceShareDate,
    String? origin,
    String? prefix,
    String? projectLink,
    int? publishTime,
    int? selfVisible,
    int? shareDate,
    String? shareUser,
    int? superChapterId,
    String? superChapterName,
    List<ArticleInfoDatasTags>? tags,
    String? title,
    int? type,
    int? userId,
    int? visible,
    int? zan,
    int? originId,
  }) {
    return ArticleInfoDatas()
      ..apkLink = apkLink ?? this.apkLink
      ..audit = audit ?? this.audit
      ..author = author ?? this.author
      ..canEdit = canEdit ?? this.canEdit
      ..chapterId = chapterId ?? this.chapterId
      ..chapterName = chapterName ?? this.chapterName
      ..collect = collect ?? this.collect
      ..courseId = courseId ?? this.courseId
      ..desc = desc ?? this.desc
      ..descMd = descMd ?? this.descMd
      ..envelopePic = envelopePic ?? this.envelopePic
      ..fresh = fresh ?? this.fresh
      ..id = id ?? this.id
      ..link = link ?? this.link
      ..niceDate = niceDate ?? this.niceDate
      ..niceShareDate = niceShareDate ?? this.niceShareDate
      ..origin = origin ?? this.origin
      ..prefix = prefix ?? this.prefix
      ..projectLink = projectLink ?? this.projectLink
      ..publishTime = publishTime ?? this.publishTime
      ..selfVisible = selfVisible ?? this.selfVisible
      ..shareDate = shareDate ?? this.shareDate
      ..shareUser = shareUser ?? this.shareUser
      ..superChapterId = superChapterId ?? this.superChapterId
      ..superChapterName = superChapterName ?? this.superChapterName
      ..tags = tags ?? this.tags
      ..title = title ?? this.title
      ..type = type ?? this.type
      ..userId = userId ?? this.userId
      ..visible = visible ?? this.visible
      ..zan = zan ?? this.zan
      ..originId = originId ?? this.originId;
  }
}

ArticleInfoDatasTags $ArticleInfoDatasTagsFromJson(Map<String, dynamic> json) {
  final ArticleInfoDatasTags articleInfoDatasTags = ArticleInfoDatasTags();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    articleInfoDatasTags.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    articleInfoDatasTags.url = url;
  }
  return articleInfoDatasTags;
}

Map<String, dynamic> $ArticleInfoDatasTagsToJson(ArticleInfoDatasTags entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}

extension ArticleInfoDatasTagsExtension on ArticleInfoDatasTags {
  ArticleInfoDatasTags copyWith({
    String? name,
    String? url,
  }) {
    return ArticleInfoDatasTags()
      ..name = name ?? this.name
      ..url = url ?? this.url;
  }
}
