import 'package:country_lists/data/vos/country_vo.dart';

sealed class CountryDetailState{}

class CountryDetailLoading extends CountryDetailState{}

class CountryDetailSuccess extends CountryDetailState{
  final CountryVO country;

  CountryDetailSuccess({required this.country});
}

class CountryDetailFail extends CountryDetailState{
   final String errorMessage;

   CountryDetailFail({required this.errorMessage});
}