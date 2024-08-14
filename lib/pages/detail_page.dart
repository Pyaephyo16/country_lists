import 'package:country_lists/data/vos/country_vo.dart';
import 'package:country_lists/provider/country_detail/country_detail_notifier.dart';
import 'package:country_lists/provider/country_detail/country_detail_state.dart';
import 'package:country_lists/widgets/country_detail_view.dart';
import 'package:country_lists/widgets/fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
   DetailPage({super.key,required this.name});

  final String name;

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {

  final countryDetailNotifierProvider = AutoDisposeNotifierProvider<CountryDetailNotifier,CountryDetailState>(() => CountryDetailNotifier());
  CountryDetailNotifier? countryDetailNotifier;

  @override
  void initState() {
    super.initState();
      _getCountryDetail();

  }

  @override
  void didUpdateWidget(covariant DetailPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getCountryDetail();;
  }

  void _getCountryDetail(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      ref.read(countryDetailNotifierProvider.notifier).getCountryDetail(widget.name.toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {

     countryDetailNotifier = ref.read(countryDetailNotifierProvider.notifier);

    CountryDetailState currentState = ref.watch(countryDetailNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.name}"),
      ),
      body: switch(currentState){
        CountryDetailLoading() => const Center(child: CircularProgressIndicator(),),
        CountryDetailSuccess(country: CountryVO country) => CountryDetailView(country: country),
        CountryDetailFail(errorMessage: String errorMessage) => FailWidget(
          errorMessage: errorMessage,
        tryAgain: (){
            _getCountryDetail();
        },),
      },
    );
  }
}
