// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_name_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NativeNameVO _$NativeNameVOFromJson(Map<String, dynamic> json) => NativeNameVO(
      json['afr'] == null
          ? null
          : SubNativeNameVO.fromJson(json['afr'] as Map<String, dynamic>),
      json['eng'] == null
          ? null
          : SubNativeNameVO.fromJson(json['eng'] as Map<String, dynamic>),
      json['nbl'] == null
          ? null
          : SubNativeNameVO.fromJson(json['nbl'] as Map<String, dynamic>),
      json['nso'] == null
          ? null
          : SubNativeNameVO.fromJson(json['nso'] as Map<String, dynamic>),
      json['sot'] == null
          ? null
          : SubNativeNameVO.fromJson(json['sot'] as Map<String, dynamic>),
      json['ssw'] == null
          ? null
          : SubNativeNameVO.fromJson(json['ssw'] as Map<String, dynamic>),
      json['tsn'] == null
          ? null
          : SubNativeNameVO.fromJson(json['tsn'] as Map<String, dynamic>),
      json['tso'] == null
          ? null
          : SubNativeNameVO.fromJson(json['tso'] as Map<String, dynamic>),
      json['ven'] == null
          ? null
          : SubNativeNameVO.fromJson(json['ven'] as Map<String, dynamic>),
      json['xho'] == null
          ? null
          : SubNativeNameVO.fromJson(json['xho'] as Map<String, dynamic>),
      json['zul'] == null
          ? null
          : SubNativeNameVO.fromJson(json['zul'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NativeNameVOToJson(NativeNameVO instance) =>
    <String, dynamic>{
      'afr': instance.afr,
      'eng': instance.eng,
      'nbl': instance.nbl,
      'nso': instance.nso,
      'sot': instance.sot,
      'ssw': instance.ssw,
      'tsn': instance.tsn,
      'tso': instance.tso,
      'ven': instance.ven,
      'xho': instance.xho,
      'zul': instance.zul,
    };
