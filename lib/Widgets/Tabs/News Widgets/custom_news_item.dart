// ignore_for_file: must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_news/Models/news_response.dart';
import 'package:flutter_application_news/ThemeApp/theme_app.dart';

class CustomNewsItem extends StatelessWidget {
  CustomNewsItem({super.key, required this.news});
  News news;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              fit: BoxFit.fill,
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                backgroundColor: ThemeApp.primaryLightColor,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            news.author ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ThemeApp.grayColor,
                ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: ThemeApp.grayColor,
                ),
          ),
          Text(
            news.publishedAt ?? '',
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ThemeApp.grayColor,
                ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
