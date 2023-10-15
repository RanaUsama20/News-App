import 'package:flutter/material.dart';
import 'package:news_rana/MyTheme.dart';
import 'package:news_rana/Category_details/categoryDM.dart';

class CategoryItem extends StatelessWidget{
  CategoryDM category;
  int index;
  CategoryItem({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(index%2 == 0? 0 : 20) ,
            bottomLeft: Radius.circular(index%2 != 0? 0 : 20)
          )
        ),
        child: Column(
          children: [
            Image.asset(category.image,
            height: MediaQuery.of(context).size.height*0.15),
            Text(category.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: MyTheme.whiteColor
              ) ,)
          ],
        ),
      ),
    );
  }

}