import 'package:flutter/material.dart';
import 'package:news_rana/HomeScreen/NewsItem.dart';
import 'package:news_rana/model/NewsResponse.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_manager.dart';

class NewsContainer extends StatefulWidget {
  Source source;
  int currentPage = 1;

  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
    loadNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySourceId(widget.source.id ?? '', widget.currentPage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('Something went wrong'),
              ElevatedButton(
                onPressed: () {
                  loadNewsData();
                },
                child: Text('Try Again'),
              ),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Text(snapshot.data?.message ?? '');
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          controller: scrollController,
          itemCount: isLoading ? newsList.length + 1 : newsList.length,
          itemBuilder: (context, index) {
            if (index < newsList.length) {
              return NewsItem(news: newsList[index]);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }

  Future<void> scrollListener() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
        !isLoading) {
      setState(() {
        isLoading = true;
      });
      widget.currentPage++;
      loadNewsData();
    }
  }

  Future<void> loadNewsData() async {
    try {
      final additionalNews = await ApiManager.getNewsBySourceId(widget.source.id ?? '', widget.currentPage);
      if (additionalNews.articles!.isNotEmpty) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      throw e;
    }
  }
}
