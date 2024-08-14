
import 'package:country_lists/data/model/country_model.dart';
import 'package:country_lists/provider/country_list/country_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/vos/country_vo.dart';

class CountryNotifier extends AutoDisposeNotifier<CountryState>{

  ///Model
  final CountryModel model = CountryModel();

  ///State variable
  List<CountryVO>? countryList;

  @override
  CountryState build() {
    ref.onDispose((){
        print("country list dispose");
    });
    return CountryLoading();
  }

  void getCountryList()async{
      try{
        state = CountryLoading();
        countryList = await model.getAllCountries().then((value){
            state = CountrySuccess(countryList: value);
        });
      }catch(e){
        state = CountryFail(errorMessage: e.toString());
    }
  }

}