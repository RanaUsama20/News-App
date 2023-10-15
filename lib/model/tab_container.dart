import 'package:flutter/material.dart';
import 'package:news_rana/model/SourceResponse.dart';
import 'package:news_rana/model/news_container.dart';
import 'package:news_rana/model/tabItems.dart';

class TabContainer extends StatefulWidget{
  List<Source> sourcesList;
  TabContainer({required this.sourcesList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
              selectedIndex = index;
              setState(() {

              });

              },
              isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sourcesList.map((source) => TabItems(
                    source: source,
                    isSelected: selectedIndex == widget.sourcesList.indexOf(source))).
                toList()
            ),
            Expanded(
                child: NewsContainer(source: widget.sourcesList[selectedIndex],)),
          ],
        ));
  }
}