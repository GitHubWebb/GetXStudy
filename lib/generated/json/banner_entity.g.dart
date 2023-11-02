// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../entity/banner_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerEntity _$BannerEntityFromJson(Map<String, dynamic> json) => BannerEntity()
  ..desc = json['desc'] as String?
  ..id = json['id'] as int?
  ..imagePath = json['imagePath'] as String?
  ..isVisible = (json['isVisible'] as num?)?.toDouble()
  ..order = (json['order'] as num?)?.toDouble()
  ..title = json['title'] as String?
  ..type = (json['type'] as num?)?.toDouble()
  ..url = json['url'] as String?
  ..link = json['link'] as String?
  ..originId = json['originId'] as int?;

Map<String, dynamic> _$BannerEntityToJson(BannerEntity instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
      'link': instance.link,
      'originId': instance.originId,
    };
