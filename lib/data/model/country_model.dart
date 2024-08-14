
import 'package:country_lists/data/vos/country_vo.dart';
import 'package:dio/dio.dart';

import '../api_constants.dart';


class CountryModel{

  static CountryModel? _singleton;
  final dio = Dio();

  CountryModel._internal(){
    dio.options = BaseOptions(
        headers: {
          HEADER_ACCEPT : APPLICATION_JSON,
          HEADER_CONTENT_TYPE : APPLICATION_JSON
        }
    );
  }

  factory CountryModel(){
    _singleton ??= CountryModel._internal();
    return _singleton!;
  }

  Future<List<CountryVO>> getAllCountries()async{
    Uri uri = Uri.parse('$KBASE_URL/$KEND_POINT_ALL_COUNTRIES?fields=name,region,flags');
    final response = await dio.getUri(uri);
    return (response.data as List).map((data) => CountryVO.fromJson(data)).toList();
  }

  Future<CountryVO> getCountryDetail(String name)async{
    Uri uri = Uri.parse("$KBASE_URL/$KEND_POINT_COUNTRY_DETAIL/$name?fullText=true&fields=name,capital,flags,population,region,subregion");
    final response = await dio.getUri(uri);
    List<CountryVO> countryDetailList = (response.data as List).map((data) => CountryVO.fromJson(data)).toList();
    return countryDetailList.first;
  }

  Future<CountryVO> getSeachCountry(String searchName)async{
      Uri uri = Uri.parse("$KBASE_URL/$KEND_POINT_SEARCH_COUNTRY/$searchName?fullText=true&fields=name,capital,flags,population,region,subregion");
      final response = await dio.getUri(uri);
      List<CountryVO> countryList = (response.data as List).map((data) => CountryVO.fromJson(data)).toList();
      return countryList.first;
  }

}