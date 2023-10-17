import 'package:flutter/material.dart';
import 'package:news_rana/HomeScreen/NewsItem.dart';
import 'package:news_rana/HomeScreen/news_container_view_model.dart';
import 'package:news_rana/model/NewsResponse.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/api_manager.dart';
import 'package:provider/provider.dart';

class NewsContainer extends StatefulWidget {
  Source source;
  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {

  int currentPage = 1;
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
NewsContainerViewModel viewModel = NewsContainerViewModel();
  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
    loadNewsData();
    viewModel.getNewsBySourceId(widget.source.id??"", currentPage);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsContainerViewModel>(
          builder: (context,viewModel,child){
            if(viewModel.errorMessage != null){
              return Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(onPressed: (){
                    viewModel.getNewsBySourceId(widget.source.id??"",currentPage);
                    loadNewsData();
                  }, child: Text( 'Try Again'))
                ],
              );
            }
            else if(viewModel.newsList == null){
              return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ));
            }
            else{
             return ListView.builder(
                controller: scrollController,
                itemCount: isLoading ? viewModel.newsList!.length + 1 : viewModel.newsList!.length,
                itemBuilder: (context, index) {
                  if (index < viewModel.newsList!.length) {
                    return NewsItem(news: viewModel.newsList![index]);
                  }
                },
              );
            }

          }),
    );

  }

  Future<void> scrollListener() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
        !isLoading) {
      setState(() {
        isLoading = true;
      });
      currentPage++;
      loadNewsData();
    }
  }

  Future<void> loadNewsData() async {
    try {
      final additionalNews = await ApiManager.getNewsBySourceId(widget.source.id ?? '', currentPage);
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
