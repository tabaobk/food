import 'package:flutter/material.dart';
import 'package:meal_appication/dummy_data.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'DeliMeal',
      //   ),
      // ),
      // body:
      GridView(
        padding: const EdgeInsets.all(10),
          children: DUMMY_CATEGORIES
              .map((e) => CategoryItem(e.id, e.title, e.color))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 2));
    // );
  }
}
