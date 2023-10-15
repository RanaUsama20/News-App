import 'package:flutter/material.dart';
import 'package:news_rana/model/NewsItem.dart';
import 'package:news_rana/model/NewsResponse.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_manager.dart';

class NewsContainer extends StatefulWidget{
  Source source;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySourceId(widget.source.id??''),
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
                      ApiManager.getNewsBySourceId(widget.source.id??'');
                      setState(() {

                      });
                    },
                    child: Text('Try Again'))
              ],
            );
          }
    if(snapshot.data?.status != 'ok'){
    return Text(snapshot.data?.message??'');
    }
    var newsList = snapshot.data?.articles??[];
    return ListView.builder(
      itemCount: newsList.length,
        itemBuilder: (context,index){
          return NewsItem(news: newsList[index]);
        });
        });
  }
}