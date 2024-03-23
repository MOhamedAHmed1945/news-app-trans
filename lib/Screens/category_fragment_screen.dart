// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../Models/category_d_m.dart';
import '../Widgets/custom_category_item.dart';

class CategoryFragmentScreen extends StatelessWidget {
  CategoryFragmentScreen({super.key, required this.onCategoryItemClick});
  static String routeName = 'categoryFragmentScreen';
  var categoriesList = CategoryDM.getCategories();
  Function onCategoryItemClick;
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
          SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onCategoryItemClick(
                        categoriesList[index]
                      );
                    },
                    child: CustomCategoryItem(
                      category: categoriesList[index],
                      index: index,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
