import 'package:flutter/material.dart';
import 'package:news_rana/MyTheme.dart';

class HomeDrawer extends StatelessWidget{
  Function onSideMenuItem;
  static const int categories = 1;
  static const int settings = 2;
  HomeDrawer({required this.onSideMenuItem});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: MediaQuery.of(context).size.height*0.2,
              child: Center(
                child: Text('News App!',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: MyTheme.whiteColor,
                  fontSize: 22
                ),),
              ),
            ),
            InkWell(
              onTap: (){
                onSideMenuItem(HomeDrawer.categories);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.list),
                    SizedBox(width: 15,),
                    Text('Categories',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: MyTheme.blackColor,
                      fontSize: 24
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,),
            InkWell(
              onTap: (){
                onSideMenuItem(HomeDrawer.settings);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 15,),
                    Text('Settings',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: MyTheme.blackColor,
                      fontSize: 24
                    ),)
                  ],
                ),
              ),
            )
          ]),
    );
  }

}