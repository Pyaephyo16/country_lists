// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryVO _$CountryVOFromJson(Map<String, dynamic> json) => CountryVO(
      json['flags'] == null
          ? null
          : FlagVO.fromJson(json['flags'] as Map<String, dynamic>),
      json['name'] == null
          ? null
          : NameVO.fromJson(json['name'] as Map<String, dynamic>),
      json['region'] as String?,
      (json['capital'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['subregion'] as String?,
      (json['population'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CountryVOToJson(CountryVO instance) => <String, dynamic>{
      'flags': instance.flags,
      'name': instance.name,
      'region': instance.region,
      'capital': instance.capital,
      'subregion': instance.subregion,
      'population': instance.population,
    };
