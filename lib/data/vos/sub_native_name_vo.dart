import 'package:json_annotation/json_annotation.dart';

part 'sub_native_name_vo.g.dart';

@JsonSerializable()
class SubNativeNameVO{

  @JsonKey(name: "official")
  String? official;

  @JsonKey(name: "common")
  String? common;

  SubNativeNameVO.empty();

  SubNativeNameVO(this.official, this.common);

  factory SubNativeNameVO.fromJson(Map<String,dynamic> json) => _$SubNativeNameVOFromJson(json);

  Map<String,dynamic> toJson() => _$SubNativeNameVOToJson(this);

  @override
  String toString() {
    return 'SubNativeNameVO{official: $official, common: $common}';
  }
}