// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/categories_page.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.departement});
  CategoryModel departement;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return CategoriesPage(type: departement.departementName);
          }));
        },
        child: Container(
          width: 240,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(departement.imagePath),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Center(
            child: Text(departement.departementName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17),)
          ),
        ),
      ),
    );
  }
}