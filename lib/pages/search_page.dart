import 'package:country_lists/provider/search_country/search_notifier.dart';
import 'package:country_lists/provider/search_country/search_state.dart';
import 'package:country_lists/widgets/country_detail_view.dart';
import 'package:country_lists/widgets/fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/vos/country_vo.dart';

class SearchPage extends ConsumerStatefulWidget {
   SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {

  TextEditingController _controller = TextEditingController();

  final searchNotifierProvider = AutoDisposeNotifierProvider<SearchNotifier,SearchState>(() => SearchNotifier());
  SearchNotifier? searchNotifier;

  @override
  Widget build(BuildContext context) {

    searchNotifier = ref.read(searchNotifierProvider.notifier);
    SearchState currentState = ref.watch(searchNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ///Search View
              Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 6),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:  TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: "Search...",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: 16,),
                  GestureDetector(
                    onTap: (){
                      if(_controller.text.length > 0) {
                        ref.read(searchNotifierProvider.notifier).getSearchCountry(_controller.text.toString());
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 1,
                        )
                      ),
                      child: Icon(Icons.search,color: Colors.blueGrey,size: 24,),
                    ),
                  )
                ],
              ),
              ///Result
              Expanded(
                  child: switch(currentState){
                    SearchLoading() => const Center(child: Text("The result will appear here!"),),
                    SearchSuccess(country: CountryVO country) => CountryDetailView(country: country),
                    SearchFail(errorMessage: String errorMessage) => FailWidget(
                        errorMessage: errorMessage,
                        tryAgain: (){
                          context.go("/name");
                        }
                    ),
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
