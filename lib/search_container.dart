import 'package:flutter/material.dart';
import 'package:news_rana/HomeScreen/NewsItem.dart';
import 'package:news_rana/model/NewsResponse.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_manager.dart';

class SearchContainer extends StatefulWidget {

  int currentPage = 1;
  final TextEditingController searchController;


  SearchContainer({required this.searchController});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
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
    return Scaffold(
      body: FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySearchIn(widget.searchController.text),
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
      ),
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
      final additionalNews = await ApiManager.getNewsBySearchIn(widget.searchController.text);
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
