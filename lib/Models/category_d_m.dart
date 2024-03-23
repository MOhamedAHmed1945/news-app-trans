// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_application_news/ThemeApp/theme_app.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;
  Color color;
  CategoryDM({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.color,
  });
  static List<CategoryDM> getCategories() {
    return [
      CategoryDM(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/bussines.png',
          color: ThemeApp.brownColor),
      CategoryDM(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/environment.png',
          color: ThemeApp.blueColor),
      CategoryDM(
          id: 'general',
          title: 'General',
          imagePath: 'assets/Politics.png',
          color: ThemeApp.darkBlueColor),
      CategoryDM(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/health.png',
          color: ThemeApp.pinkColor),
      CategoryDM(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/science.png',
          color: ThemeApp.yellowColor),
      CategoryDM(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/ball.png',
          color: ThemeApp.redColor),
      CategoryDM(
          id: 'technology',
          title: 'Technology',
          imagePath: 'assets/science.png',
          color: ThemeApp.darkBlueColor),
    ];
  }
}
