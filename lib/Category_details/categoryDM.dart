import 'package:flutter/material.dart';
import 'package:news_rana/MyTheme.dart';

class CategoryDM{
  String Id;
  String title;
  String image;
  Color  color;

  CategoryDM({required this.Id,required this.title,
    required this.image,required this.color});

  static List<CategoryDM> getCategories(){
    return [
      CategoryDM(Id: 'sports', title: 'Sports',
          image: 'assets/images/ball.png', color: MyTheme.redColor),
      CategoryDM(Id: 'general', title: 'General',
          image: 'assets/images/Politics.png', color: MyTheme.darkBlueColor),
      CategoryDM(Id: 'health', title: 'Health',
          image: 'assets/images/health.png', color: MyTheme.pinkColor),
      CategoryDM(Id: 'business', title: 'Business',
          image: 'assets/images/bussines.png', color: MyTheme.brownColor),
      CategoryDM(Id: 'technology', title: 'Technology',
          image: 'assets/images/environment.png', color: MyTheme.blueColor),
      CategoryDM(Id: 'science', title: 'Science',
          image: 'assets/images/science.png', color: MyTheme.yellowColor),

    ];
  }
}