import 'package:json_annotation/json_annotation.dart';

part 'flag_vo.g.dart';

@JsonSerializable()
class FlagVO{

    @JsonKey(name: "png")
    String? png;

    @JsonKey(name: "svg")
    String? svg;

    @JsonKey(name: "alt")
    String? alt;

    FlagVO.empty();

    FlagVO(this.png, this.svg, this.alt);

    factory FlagVO.fromJson(Map<String,dynamic> json) => _$FlagVOFromJson(json);

    Map<String,dynamic> toJson() => _$FlagVOToJson(this);

    @override
  String toString() {
    return 'FlagVO{png: $png, svg: $svg, alt: $alt}';
  }
}