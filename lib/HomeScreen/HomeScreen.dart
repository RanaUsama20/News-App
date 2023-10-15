import 'package:flutter/material.dart';
import 'package:news_rana/MyTheme.dart';
import 'package:news_rana/HomeScreen/home_drawer.dart';
import 'package:news_rana/Category_details/categoryDM.dart';
import 'package:news_rana/Category_details/category_details.dart';
import 'package:news_rana/Category_details/category_fragment.dart';
import 'package:news_rana/Settings/settingsTab.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName = 'Home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
            child: Image.asset('assets/images/pattern.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,)),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(selectedMenuItem == HomeDrawer.settings? 'Settings' :
            selectedCategory == null? 'News App' : selectedCategory!.title,
                style: Theme.of(context).textTheme.titleLarge),
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItem: onSideMenuItem),
          ),
          body: selectedMenuItem == HomeDrawer.settings?
              SettingsTab()
          :
          selectedCategory == null?
          CategoryFragment(onCategoryClick: onCategoryClick ,) :
              CategoryDetails(category: selectedCategory!)
        ),

      ],
    );
  }

  CategoryDM? selectedCategory;
 int selectedMenuItem = HomeDrawer.categories;
  void onCategoryClick(CategoryDM newSelectedCategory){
  selectedCategory = newSelectedCategory;
setState(() {

});
  }
  void onSideMenuItem(int newSelectedMenuItem){
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}