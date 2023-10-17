import 'package:flutter/material.dart';
import 'package:news_rana/MyTheme.dart';
import 'package:news_rana/model/SourceResponse.dart';

class TabItems extends StatelessWidget{
  Source source;
  bool isSelected;
  TabItems({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 18
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: isSelected? Theme.of(context).primaryColor : Colors.transparent,
        border: Border.all(
        color: Theme.of(context).primaryColor,
        width: 3,
         )
      ),
      child: Text(source.name??'',
      style: isSelected?
      Theme.of(context).textTheme.titleMedium!.copyWith(
        color: MyTheme.whiteColor)
      :
      Theme.of(context).textTheme.titleMedium!.copyWith(
          color: MyTheme.primaryLightColor)
      ),
    );
  }

}