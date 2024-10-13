// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({super.key});
  
  List<CategoryModel> departement = [
    CategoryModel(
      departementName: 'Business', 
      imagePath: 'assets/business.jpeg', 
    ),
    CategoryModel(
      departementName: 'Technology', 
      imagePath: 'assets/ai.jpeg',
    ),
    
    CategoryModel(
      departementName: 'science', 
      imagePath: 'assets/feautur.jpeg',
    ),
    CategoryModel(
      departementName: 'health', 
      imagePath: 'assets/cook.jpeg',
    ),
    CategoryModel(
      departementName: 'entertainment', 
      imagePath: 'assets/art.jpeg',
    ),
    
    CategoryModel(
      departementName: 'sport', 
      imagePath: 'assets/sport.jpeg',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: departement.length,
        itemBuilder: (BuildContext context, int index) { 
          return CategoryCard(departement: departement[index]);
        } 
      ),
    );
  }
}
