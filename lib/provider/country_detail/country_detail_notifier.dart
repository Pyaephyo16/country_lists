import 'package:country_lists/data/model/country_model.dart';
import 'package:country_lists/provider/country_detail/country_detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/vos/country_vo.dart';

class CountryDetailNotifier extends AutoDisposeNotifier<CountryDetailState>{

  ///Model
  CountryModel model = CountryModel();

  ///State variable
  CountryVO? country;

  @override
  CountryDetailState build() {
   ref.onDispose((){
     print("country detail dispose");
   });
   return CountryDetailLoading();
  }

  void getCountryDetail(String name)async{
    try{
      state = CountryDetailLoading();
      country = await model.getCountryDetail(name).then((data){
         state = CountryDetailSuccess(country: data);
      });
    }catch(e){
      state = CountryDetailFail(errorMessage: e.toString());
    }
  }

}