import 'package:flutter/material.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_manager.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
List<Source>? sourceList;
String? errorMessage;
void getSourcesByCategoryId(String categoryId)async{
  sourceList = null;
  errorMessage = null;
  notifyListeners();
  try{
    var response = await ApiManager.getSources(categoryId);
    if(response.status == 'error'){
      errorMessage = response.message;
    }
    else {
      sourceList = response.sources;
    }
  }catch(e){
    errorMessage = 'Error Loading Sources';
  }
  notifyListeners();
}

}