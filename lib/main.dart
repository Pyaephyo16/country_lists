import 'package:country_lists/pages/detail_page.dart';
import 'package:country_lists/pages/home_page.dart';
import 'package:country_lists/pages/search_page.dart';
import 'package:country_lists/widgets/fail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Country Lists',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        //home: const HomePage(),
        routerConfig: GoRouter(
            routes: [
              ///Home Page
          GoRoute(
            path: '/',
            builder: (context,routeState){
              return const HomePage();
            }
          ),
            ///Detail Page
              GoRoute(
                  path: '/name/:countryname',
                builder: (context,routeState){
                    String? name = routeState.pathParameters['countryname'] ?? "";
                    return DetailPage(name: name);
                }
              ),
              GoRoute(
                  path: '/search',
                builder: (context,routeState){
                      return SearchPage();
                }
              )
        ],
        errorBuilder: (BuildContext context,_){
              return Material(
                child: FailWidget(
                    errorMessage: "No Data Found!",
                    tryAgain: (){
                      context.go("/");
                    }
                ),
              );
        }
        ),
      ),
    );
  }
}



