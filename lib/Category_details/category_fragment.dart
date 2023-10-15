import 'package:flutter/material.dart';
import 'package:news_rana/MyTheme.dart';
import 'package:news_rana/Category_details/categoryDM.dart';
import 'package:news_rana/Category_details/category_item.dart';

class CategoryFragment extends StatelessWidget{
  var categoryList = CategoryDM.getCategories();
  Function onCategoryClick;
  CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Pick your category \n of interest',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: MyTheme.greyColor
                )),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15
                ),
                 itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categoryList[index]);
                    },
                      child: CategoryItem(category: categoryList[index] , index: index));
                 },
                 itemCount: categoryList.length,),
          )
        ],
      ),
    );
  }

}