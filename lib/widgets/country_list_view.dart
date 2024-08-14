import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/vos/country_vo.dart';

class CountryListView extends StatelessWidget {
   CountryListView({super.key,required this.countryList,required this.tapFlagCard});

  final List<CountryVO> countryList;
  final Function(CountryVO) tapFlagCard;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: countryList.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: (){
                if(kIsWeb){
                  context.go("/name/${countryList[index].name?.common}");
                }else {
                  context.push("/name/${countryList[index].name?.common}");
                }
                },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Image
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 8,
                                offset: Offset(4,12),
                              )
                            ]
                          ),
                          child: CachedNetworkImage(
                              imageUrl: countryList[index].flags?.png ?? "",
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 60,
                            placeholder: (context,_) => const Center(child: CircularProgressIndicator(),),
                            errorWidget: (conetxt,__,child) => const Icon(Icons.error,color: Colors.red,size: 33,),
                          ),
                        ),
                        ///title and Region
                        Padding(
                          padding: const EdgeInsets.only(left: 22,top: 6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(countryList[index].name?.common ?? "",
                              style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                              ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("REGION : ",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                    ),),
                                  Text(countryList[index].region ?? "",
                                    style:const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                    ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: IconButton(
                              onPressed: tapFlagCard(countryList[index]),
                              icon: const Icon(Icons.info_outline,color: Colors.blueGrey,size: 22,),
                          ),
                        )
                      ],
                    ),
                  ),
                 const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.blueGrey,),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
