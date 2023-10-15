import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  static const String routeName = 'Home-screen';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('News App',
        style: Theme.of(context).textTheme.titleLarge),
      ),
    );
  }

}