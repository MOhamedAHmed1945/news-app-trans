// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_news/Screens/category_details_screen.dart';
import 'package:flutter_application_news/Screens/category_fragment_screen.dart';
import '../Models/category_d_m.dart';
import '../Widgets/Drawer/custom_home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMenuItem == HomeDrawer.settings ? 'Settings' : selectedCategory == null ? 
           'News App': selectedCategory!.title,
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
      drawer: Drawer(
        child: HomeDrawer(
          onSideMenuItemClick: onSideMenuItemClick,
        ),
      ),
      body: selectedCategory == null
          ? CategoryFragmentScreen(
              onCategoryItemClick: onCategoryItemClick,
            )
          : CategoryDetailsScreen(
              category: selectedCategory!,
            ),
    );
  }

  CategoryDM? selectedCategory;
  void onCategoryItemClick(CategoryDM newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick(int newSelectedMenuItem) {
    selectedMenuItem = newSelectedMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
