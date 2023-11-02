
import '../base/interface.dart';
import '../generated/json/base/json_field.dart';
import 'dart:convert';

part '../generated/json/banner_entity.g.dart';

@JsonSerializable()
class BannerEntity implements IWebLoadInfo {
  String? desc;
  @override
  int? id;
  String? imagePath;
  double? isVisible;
  double? order;
  @override
  String? title;
  double? type;
  String? url;
  @override
  String? link;
  @override
  int? originId;

  BannerEntity();

  factory BannerEntity.fromJson(Map<String, dynamic> json) =>
      _$BannerEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BannerEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
