// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_news/Models/sourse_response.dart';
import 'package:flutter_application_news/ThemeApp/theme_app.dart';

class CustomTabItem extends StatelessWidget {
  CustomTabItem({super.key, required this.isSelected, required this.source});
  bool isSelected;
  Source source;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? ThemeApp.primaryLightColor : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: ThemeApp.primaryLightColor,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color:
                  isSelected ? ThemeApp.whiteColor : ThemeApp.primaryLightColor,
              fontSize: 18,
            ),
      ),
    );
  }
}
