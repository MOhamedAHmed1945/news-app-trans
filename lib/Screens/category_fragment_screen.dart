// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Models/category_d_m.dart';
import '../Widgets/Tabs/custom_category_Item.dart';

class CategoryFragmentScreen extends StatelessWidget {
  CategoryFragmentScreen({super.key});
  static String routeName = 'categoryFragmentScreen';
  var categoriesList = CategoryDM.getCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick Your Category \n of Interest',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 15.0,),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return CustomCategoryItem(
                    category: categoriesList[index],
                    index: index,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
