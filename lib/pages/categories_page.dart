
import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoriesPage extends StatelessWidget{
  const CategoriesPage({
    super.key,
    required this.type
  });
  final String type;
  
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
            NewsListViewBuilder(type: type),
          ],
        ),
      ),
    );
  }
}
