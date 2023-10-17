import 'package:flutter/material.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_manager.dart';
import 'package:news_rana/Category_details/categoryDM.dart';
import 'package:news_rana/HomeScreen/tab_container.dart';



class CategoryDetails extends StatefulWidget{
  static const String routeName = 'Category-Details';
  CategoryDM category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:FutureBuilder<SourceResponse>(
          future: ApiManager.getSources(widget.category.Id),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),);
            }
            else if(snapshot.hasError){
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(
                      onPressed: (){
                        ApiManager.getSources(widget.category.Id);
                        setState(() {

                        });
                      },
                      child: Text('Try Again'))
                ],
              );
            }
            if(snapshot.data?.status != 'ok'){
              return Column(
                children: [
                  Text(snapshot.data?.message??''),
                  ElevatedButton(
                      onPressed: (){
                      },
                      child: Text('Try Again'))
                ],
              );
            }
            var sourceList = snapshot.data?.sources??[];
            return TabContainer(sourcesList: sourceList);
          }
      )
      ,
    );
  }
}