

import 'package:flutter/material.dart';
import 'package:flutter_application_news/Apis/api_manager.dart';
import 'package:flutter_application_news/ThemeApp/theme_app.dart';
import '../Models/sourse_response.dart';
import '../Widgets/Tabs/custom_tab_widget.dart';


class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key});
  static String routeName = 'categoryDetailsScreen';

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      body: FutureBuilder<SourseResponse?>(
        future: ApiManager.getSources(),
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
                    ApiManager.getSources();
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
                    ApiManager.getSources();
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
      ),
    );
  }
}
