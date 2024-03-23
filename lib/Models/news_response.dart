//NewsResponse

import 'package:flutter_application_news/Models/sourse_response.dart';

class News {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  News({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      source: Source.fromJson(json['source']),
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }
}

class NewsResponse {
  String status;
  int totalResults;
  List<News> articles;
  String? message;
  String? code;
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
    this.code,
    this.message,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    var articleList = json['articles'] as List;
    List<News> articles =
        articleList.map((article) => News.fromJson(article)).toList();
    return NewsResponse(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: articles,
      code: json['code'],
      message: json['message'],
    );
  }
}
