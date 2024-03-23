// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../ThemeApp/theme_app.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onSideMenuItemClick});
  Function onSideMenuItemClick;
  static const int categories = 1;
   static const int settings = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          // height: 100,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          color: ThemeApp.primaryLightColor,
          child: Text(
            'Newes App!',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                const Icon(Icons.list),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: InkWell(
            onTap: () {
              onSideMenuItemClick(settings);
            },
            child: Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
