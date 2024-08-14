import 'package:country_lists/data/model/country_model.dart';
import 'package:country_lists/provider/search_country/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/vos/country_vo.dart';

class SearchNotifier extends AutoDisposeNotifier<SearchState>{

  ///Model
  CountryModel model = CountryModel();

  ///State Variable
  CountryVO? country;


  @override
  SearchState build() {
    ref.onDispose((){
      print("search page dispose");
    });
    return SearchLoading();
  }

  void getSearchCountry(String name)async{
    try{
        state = SearchLoading();
        country = await model.getSeachCountry(name).then((data){
            state = SearchSuccess(country: data);
        });
    }catch(e){
      state = SearchFail(errorMessage: e.toString());
    }
  }

}