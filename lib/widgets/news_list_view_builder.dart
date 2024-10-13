import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_list_view.dart';
import 'package:news_app/services/news_service.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
    required this.type
  });
  final String type;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> future;
  
  @override
  void initState() {
    super.initState();
    future = NewsService(dio: Dio()).getNews(widget.type);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future, 
      builder: (context, snapshot){
        if(snapshot.hasData){
        return NewsListView(
          articles: snapshot.data!,
        );}else if (snapshot.hasError) {
          return const SliverToBoxAdapter(child: Text('Opps there is an Error, try later'));
        }else{
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator())
          );
        }
      }
    );
  }
}
