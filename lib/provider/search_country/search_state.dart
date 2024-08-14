import 'package:country_lists/data/vos/country_vo.dart';

sealed class SearchState{}

class SearchLoading extends SearchState{}

class SearchSuccess extends SearchState{
    final CountryVO country;

    SearchSuccess({required this.country});
}

class SearchFail extends SearchState{
  final String errorMessage;

  SearchFail({required this.errorMessage});
}