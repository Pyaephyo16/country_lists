import 'package:country_lists/data/vos/country_vo.dart';
import 'package:country_lists/provider/country_list/country_notifier.dart';
import 'package:country_lists/provider/country_list/country_state.dart';
import 'package:country_lists/widgets/country_list_view.dart';
import 'package:country_lists/widgets/fail_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  final countryNotifierProvider = AutoDisposeNotifierProvider<CountryNotifier,CountryState>(() => CountryNotifier());
  CountryNotifier? countryNotifier;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      countryNotifier?.getCountryList();
    });
  }

  @override
  Widget build(BuildContext context) {

    countryNotifier = ref.read(countryNotifierProvider.notifier);

    final CountryState currentState = ref.watch(countryNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Countries"),
      ),
      body: switch(currentState){
        ///Loading
        CountryLoading() => const Center(child: CircularProgressIndicator(),),
        ///Success
        CountrySuccess(countryList: List<CountryVO> countryList) =>
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                   if(kIsWeb){
                     context.go("/search");
                   }else{
                     context.push("/search");
                   }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 22,vertical: 22),
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      enabled: false,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide(width: 2)
                        ),
                        hintText: "Search...",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                      ),
                    ),
                  ),
                ),
                CountryListView(
                          countryList: countryList,
                          tapFlagCard: (country){
                 // showCountryImageInZoom(country);
                },
                ),
              ],
            ),
        ///Fail
        CountryFail(errorMessage: String errorMessage) => FailWidget(
            errorMessage :errorMessage,
          tryAgain: (){
              countryNotifier?.getCountryList();
      },
        ),
    },
    );
  }

  void showCountryImageInZoom(CountryVO country){
    Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        color: Colors.black,
        width: 300,
        height: 400,
      ),
    );

    showDialog(context: context, builder: (context) => dialog);
  }
}
