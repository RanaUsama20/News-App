import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_rana/MyTheme.dart';
import 'package:news_rana/model/NewsResponse.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_constants.dart';
import 'package:webview_flutter/webview_flutter.dart';


class NewsItem extends StatefulWidget{
  News news;
  NewsItem({required this.news});
  WebViewController webViewController = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
  NavigationDelegate(
  onProgress: (int progress) {
  // Update loading bar.
  },
  onPageStarted: (String url) {},
  onPageFinished: (String url) {},
  onWebResourceError: (WebResourceError error) {},
  onNavigationRequest: (NavigationRequest request) {
  if (request.url.startsWith('https://www.youtube.com/')) {
  return NavigationDecision.prevent;
  }
  return NavigationDecision.navigate;
  },
  ),
  )
    ..loadRequest(Uri.parse('https://flutter.dev'));

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
         Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewWidget(
              controller: widget.webViewController,
            ),
          ),
        );
      },
      child: Column(
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
                imageUrl: widget.news.urlToImage??'',
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),)),
          ),
          SizedBox(height: 10,),
          Text(widget.news.author??'',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: MyTheme.greyColor,
              fontSize: 14
            ) ,),
          SizedBox(height: 10,),
          Text(widget.news.title??'',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w400
          ),),
          SizedBox(height: 10,),
          Text(widget.news.publishedAt??'',textAlign: TextAlign.end,)
        ],
      ),
    );
  }
}