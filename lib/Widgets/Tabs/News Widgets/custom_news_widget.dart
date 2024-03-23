// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_news/Widgets/Tabs/News%20Widgets/custom_news_item.dart';
import '../../../Apis/api_manager.dart';
import '../../../Models/news_response.dart';
import '../../../Models/sourse_response.dart';
import '../../../ThemeApp/theme_app.dart';

class CustomNewsWidget extends StatefulWidget {
  CustomNewsWidget({super.key, required this.source});
  Source source;

  @override
  State<CustomNewsWidget> createState() => _CustomNewsWidgetState();
}

class _CustomNewsWidgetState extends State<CustomNewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourcesId(
        sourcesId: widget.source.id ?? '',
      ), //widget.source.id
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
                  ApiManager.getNewsBySourcesId(
                    sourcesId: widget.source.id ?? '',
                  );
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
                  ApiManager.getNewsBySourcesId(
                    sourcesId: widget.source.id ?? '',
                  );
                  setState(() {});
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        } else {
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return CustomNewsItem(
                news: newsList[index],
              );
            },
            itemCount: newsList.length,
          );
        }
      },
    );
  }
}
