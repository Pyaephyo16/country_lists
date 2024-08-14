import '../../data/vos/country_vo.dart';

sealed class CountryState{}

class CountryLoading extends CountryState{}

class CountrySuccess extends CountryState{
  final List<CountryVO> countryList;

  CountrySuccess({
    required this.countryList
  });
}

class CountryFail extends CountryState{
  final String errorMessage;

  CountryFail({required this.errorMessage});
}