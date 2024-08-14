import 'package:country_lists/data/vos/sub_native_name_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'native_name_vo.g.dart';

@JsonSerializable()
class NativeNameVO{

    @JsonKey(name: "afr")
    SubNativeNameVO? afr;

    @JsonKey(name: "eng")
    SubNativeNameVO? eng;

    @JsonKey(name: "nbl")
    SubNativeNameVO? nbl;

    @JsonKey(name: "nso")
    SubNativeNameVO? nso;

    @JsonKey(name: "sot")
    SubNativeNameVO? sot;

    @JsonKey(name: "ssw")
    SubNativeNameVO? ssw;

    @JsonKey(name: "tsn")
    SubNativeNameVO? tsn;

    @JsonKey(name: "tso")
    SubNativeNameVO? tso;

    @JsonKey(name: "ven")
    SubNativeNameVO? ven;

    @JsonKey(name: "xho")
    SubNativeNameVO? xho;

    @JsonKey(name: "zul")
    SubNativeNameVO? zul;

    NativeNameVO.empty();

    NativeNameVO(this.afr, this.eng, this.nbl, this.nso, this.sot, this.ssw,
      this.tsn, this.tso, this.ven, this.xho, this.zul);

    factory NativeNameVO.fromJson(Map<String,dynamic> json) => _$NativeNameVOFromJson(json);

    Map<String,dynamic> toJson() => _$NativeNameVOToJson(this);

    @override
  String toString() {
    return 'NativeNameVO{afr: $afr, eng: $eng, nbl: $nbl, nso: $nso, sot: $sot, ssw: $ssw, tsn: $tsn, tso: $tso, ven: $ven, xho: $xho, zul: $zul}';
  }
}