// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/widgets/categories_list_view.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            Text('Cloud', style: TextStyle(color: Color.fromARGB(255, 255, 192, 98), fontWeight: FontWeight.bold)),
          ]
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(child: CategoriesListView()),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const NewsListViewBuilder(type: 'general'),
          ],
        ),
      ),
    );
  }
}
