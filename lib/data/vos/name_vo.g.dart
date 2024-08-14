// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameVO _$NameVOFromJson(Map<String, dynamic> json) => NameVO(
      json['common'] as String?,
      json['official'] as String?,
      json['nativeName'] == null
          ? null
          : NativeNameVO.fromJson(json['nativeName'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NameVOToJson(NameVO instance) => <String, dynamic>{
      'common': instance.common,
      'official': instance.official,
      'nativeName': instance.nativeName,
    };
