import 'package:country_lists/data/vos/flag_vo.dart';
import 'package:country_lists/data/vos/name_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_vo.g.dart';

@JsonSerializable()
class CountryVO{

  @JsonKey(name: "flags")
  FlagVO? flags;

  @JsonKey(name: "name")
  NameVO? name;

  @JsonKey(name: "region")
  String? region;

  @JsonKey(name: "capital")
  List<String>? capital;

  @JsonKey(name: "subregion")
  String? subregion;

  @JsonKey(name: "population")
  double? population;

  CountryVO.empty();


  CountryVO(this.flags, this.name, this.region, this.capital, this.subregion,
      this.population);

  factory CountryVO.fromJson(Map<String,dynamic> json) => _$CountryVOFromJson(json);

  Map<String,dynamic> toJson() => _$CountryVOToJson(this);

  @override
  String toString() {
    return 'CountryVO{flags: $flags, name: $name, region: $region, capital: $capital, subregion: $subregion, population: $population}';
  }
}