import 'package:flutter/material.dart';
import 'package:news_rana/Category_details/category_details_view_model.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_manager.dart';
import 'package:news_rana/Category_details/categoryDM.dart';
import 'package:news_rana/HomeScreen/tab_container.dart';
import 'package:provider/provider.dart';



class CategoryDetails extends StatefulWidget{
  static const String routeName = 'Category-Details';
  CategoryDM category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.category.Id);
  }
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context,viewModel,child){
            if(viewModel.errorMessage != null){
              return Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(onPressed: (){
                    viewModel.getSourcesByCategoryId(widget.category.Id);
                  }, child: Text( 'Try Again'))
                ],
              );
            }
            else if(viewModel.sourceList == null){
              return Center(
                  child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ));
            }
            else{
             return TabContainer(sourcesList: viewModel.sourceList!);
            }
          }),
    );

  }
}