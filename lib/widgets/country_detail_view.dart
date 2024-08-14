import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_lists/data/vos/country_vo.dart';
import 'package:flutter/material.dart';

class CountryDetailView extends StatelessWidget {
   CountryDetailView({super.key,required this.country});

  CountryVO? country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Image
            Container(
              margin: EdgeInsets.only(bottom: 16),
              width: MediaQuery.of(context).size.width,
              height: 260,
              child: CachedNetworkImage(
                imageUrl: country?.flags?.png ?? "",
                fit: BoxFit.fill,
                placeholder: (context,_) =>const Center(child: CircularProgressIndicator(),),
                errorWidget: (context,__,___) => const Center(child: Icon(Icons.error,color: Colors.red,size: 40,)),
              ),
            ),
            ///Alternative
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: RichText(
                  text: TextSpan(
                    text: "Alternative : ",
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ((country?.flags?.alt?.length)! > 0 ) ? country?.flags?.alt : " No Data Found!",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        )
                      )
                    ],
                  ),
        
              ),
            ),
            ///Country Data Table
            CountryDetailTableRowView(
                title: "NAME",
              data: "${country?.name?.common}",
              isEven: false,
            ),
            CountryDetailTableRowView(
              title: "OFFICAL NAME",
              data: "${country?.name?.official}",
              isEven: true,
            ),
            CountryDetailTableRowView(
              title: "REGION",
              data: "${country?.region}",
              isEven: false,
            ),
            CountryDetailTableRowView(
              title: "SUB REGION",
              data: "${country?.subregion}",
              isEven: true,
            ),
            CountryDetailTableRowView(
              title: "CAPITAL",
              data: "${country?.capital?.join(", ")}",
              isEven: false,
            ),
            CountryDetailTableRowView(
              title: "POPULATION",
              data: "${country?.population}",
              isEven: true,
            ),
          ],
        ),
      ),
    );
  }
}

class CountryDetailTableRowView extends StatelessWidget {
   CountryDetailTableRowView({
    super.key,
    required this.title,
     required this.data,
     required this.isEven
  });

  final String title;
  final String data;
  final bool isEven;

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: (!isEven) ? Color(0xffbfddec) : Colors.white,
            border:Border.all(
              color:(!isEven) ? Color(0xffbfddec) : Colors.white,
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Expanded(
            child: Text(title,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),),
          ),
           SizedBox(width: 22,),
            Expanded(
              child: Text(data,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),),
            ),
          ],
        )
      );
  }
}
