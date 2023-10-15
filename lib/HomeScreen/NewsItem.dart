import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_rana/MyTheme.dart';
import 'package:news_rana/model/NewsResponse.dart';

class NewsItem extends StatelessWidget{
  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(18)
            ),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage??'',
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),)),
        ),
        SizedBox(height: 10,),
        Text(news.author??'',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: MyTheme.greyColor,
            fontSize: 14
          ) ,),
        SizedBox(height: 10,),
        Text(news.title??'',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w400
        ),),
        SizedBox(height: 10,),
        Text(news.publishedAt??'',textAlign: TextAlign.end,)
      ],
    );
  }

}