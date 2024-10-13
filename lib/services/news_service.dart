// ignore_for_file: unused_catch_clause

import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  NewsService({required this.dio});
  Dio dio;

  Future<List<ArticleModel>> getNews(String category) async {
    try {
  final Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=637a8e43414e4d4d8541bad0b8de7f8c&category=$category');
  Map<String, dynamic> jsonData = response.data;
  List<dynamic> articles = jsonData['articles'];
  List<ArticleModel> articlesList = [];
  for (var a in articles) {
    ArticleModel model = ArticleModel.fromJson(a);
    if(model.title != '[Removed]') {
      articlesList.add(model);
    }
  }
  return articlesList;
  } on Exception catch (e) {
    return [];
  }
  }
  
}