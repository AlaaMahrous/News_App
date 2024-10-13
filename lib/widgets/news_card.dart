// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/widgets/web_view.dart';

class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.article});
  ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return WebViewExample(webUrl: article.url);
          }));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: article.image ?? 'https://img.freepik.com/premium-vector/closed-padlock-digital-background-cyber-security_42077-3524.jpg?w=1060',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/ai.jpeg', 
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 9),
            Text(
              article.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              article.subTitle ?? '',
              maxLines: 2,
              style: const TextStyle(color: Color.fromARGB(255, 109, 109, 109), fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
