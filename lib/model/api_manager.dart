import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_rana/model/NewsResponse.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_constants.dart';

class ApiManager{
static Future<SourceResponse> getSources(String categoryId)async{

 /// https://newsapi.org/v2/top-headlines/sources?apiKey=b5e1eab77dbc48dab1659d178506a517

 Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,
 {
  'apiKey' : 'b5e1eab77dbc48dab1659d178506a517',
  'category' : categoryId
 });
 try{
  var response = await http.get(url);
  String bodyString = response.body;
  var json = jsonDecode(bodyString);
  return SourceResponse.fromJson(json);
 }catch(e){
  throw e;
 }

}

static Future<NewsResponse> getNewsBySourceId(String sourceId,int page)async{

///https://newsapi.org/v2/everything?q=bitcoin&apiKey=b5e1eab77dbc48dab1659d178506a517

 Uri url =Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,
 {
  'apiKey' : 'b5e1eab77dbc48dab1659d178506a517',
  'sources' : sourceId,
  'page': page.toString()

 });

 try{
  var response = await http.get(url);
  String bodyString = response.body;
  var json = jsonDecode(bodyString);
  return NewsResponse.fromJson(json);
 }
 catch(e){
  throw e;
 }
}

static Future<NewsResponse> getNewsBySearchIn(String keyWord)async{

 ///https://newsapi.org/v2/everything?q=bitcoin&apiKey=b5e1eab77dbc48dab1659d178506a517

 Uri url =Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,
     {
      'apiKey' : 'b5e1eab77dbc48dab1659d178506a517',
      'q' : keyWord,
      'searchIn' : keyWord,


     });

 try{
  var response = await http.get(url);
  String bodyString = response.body;
  var json = jsonDecode(bodyString);
  return NewsResponse.fromJson(json);
 }
 catch(e){
  throw e;
 }
}

}