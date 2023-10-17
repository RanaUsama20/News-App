import 'package:flutter/material.dart';
import 'package:news_rana/MyTheme.dart';
import 'package:news_rana/HomeScreen/home_drawer.dart';
import 'package:news_rana/Category_details/categoryDM.dart';
import 'package:news_rana/Category_details/category_details.dart';
import 'package:news_rana/Category_details/category_fragment.dart';
import 'package:news_rana/Settings/settingsTab.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_manager.dart';
import 'package:news_rana/search_container.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-screen';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: isSearching == false
                ? AppBar(
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                            onTap: () {
                              isSearching = true;
                              setState(() {

                              });
                            },
                            child: Icon(
                              Icons.search,
                              color: MyTheme.whiteColor,
                              size: 40,
                            )),
                      )
                    ],
                    title: Text(
                        selectedMenuItem == HomeDrawer.settings
                            ? 'Settings'
                            : selectedCategory == null
                                ? 'News App'
                                : selectedCategory!.title,
                        style: Theme.of(context).textTheme.titleLarge),
                  )
                : searchAppBar(context,isSearching,searchController),
            drawer: isSearching? null : Drawer(
              child: HomeDrawer(onSideMenuItem: onSideMenuItem),
            ) ,
            body: isSearching ? SearchContainer(searchController: searchController,) :
               selectedMenuItem == HomeDrawer.settings
                ? SettingsTab()
                : selectedCategory == null
                    ? CategoryFragment(
                        onCategoryClick: onCategoryClick,
                      )
                    : CategoryDetails(category: selectedCategory!)),
      ],
    );
  }

  CategoryDM? selectedCategory;
  int selectedMenuItem = HomeDrawer.categories;
  void onCategoryClick(CategoryDM newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onSideMenuItem(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}

AppBar searchAppBar(BuildContext context, bool isSearching, TextEditingController searchController) {
  return AppBar(
    title: Container(
      height: 40,
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
            prefixIcon: InkWell(
              onTap: (){
                isSearching = false;
              },
              child: Icon(Icons.close,
                size: 30,
                color: Theme.of(context).primaryColor,),
            ),
            suffixIcon: InkWell(
              onTap: (){
                    ApiManager.getNewsBySearchIn(searchController.text);
              },
              child: Icon(Icons.search,
                size: 30,
                color: Theme.of(context).primaryColor,),
            ),
            filled: true,
            fillColor: MyTheme.whiteColor,
            hintText: 'search article',
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(Radius.circular(30)))),
      ),
    ),
  );
}
