import 'package:flutter/material.dart';
import 'package:news_rana/model/NewsResponse.dart';
import 'package:news_rana/model/api_manager.dart';

class NewsContainerViewModel extends ChangeNotifier{
List<News>? newsList;
String? errorMessage;
void getNewsBySourceId(String sourceId , int currentPage)async{
  newsList = null;
  errorMessage = null;
  notifyListeners();
  try{
    var response = await ApiManager.getNewsBySourceId(sourceId, currentPage);
    if(response.status == 'error'){
      errorMessage = response.message;
    }
    else{
      newsList = response.articles;
    }

  }catch (e){
  errorMessage = 'Error Loading News';
  }
  notifyListeners();
}
}