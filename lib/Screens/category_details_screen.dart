// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_news/Apis/api_manager.dart';
import 'package:flutter_application_news/ThemeApp/theme_app.dart';
import '../Models/category_d_m.dart';
import '../Models/sourse_response.dart';
import '../Widgets/Tabs/custom_tab_widget.dart';

class CategoryDetailsScreen extends StatefulWidget {
  CategoryDetailsScreen({super.key, required this.category});
  static String routeName = 'categoryDetailsScreen';
  CategoryDM category;
  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourseResponse?>(
      future: ApiManager.getSources(categoryId: widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: ThemeApp.primaryLightColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Something Went Wrong'),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(categoryId: widget.category.id);
                  setState(() {});
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        } else if (snapshot.data?.status != 'ok') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getSources(categoryId: widget.category.id);
                  setState(() {});
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        } else {
          var sourcesList = snapshot.data?.sources ?? [];
          return CustomTabWidget(
            sourceList: sourcesList,
          );
        }
      },
    );
  }
}
