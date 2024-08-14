import 'package:country_lists/data/vos/native_name_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'name_vo.g.dart';

@JsonSerializable()
class NameVO{

    @JsonKey(name: "common")
    String? common;

    @JsonKey(name: "official")
    String? official;

    @JsonKey(name: "nativeName")
    NativeNameVO? nativeName;

    NameVO.empty();

    NameVO(this.common, this.official, this.nativeName);

    factory NameVO.fromJson(Map<String,dynamic> json) => _$NameVOFromJson(json);

    Map<String,dynamic> toJson() => _$NameVOToJson(this);

    @override
  String toString() {
    return 'NameVO{common: $common, official: $official, nativeName: $nativeName}';
  }
}