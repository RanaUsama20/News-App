import 'package:flutter/material.dart';
import 'package:news_rana/HomeScreen.dart';
import 'package:news_rana/MyTheme.dart';
import 'package:news_rana/model/category_details.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }

}