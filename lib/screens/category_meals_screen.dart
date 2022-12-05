import 'package:flutter/material.dart';
import 'package:meal_appication/dummy_data.dart';
import 'package:meal_appication/widgets/meal_item.dart';

import '../models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  //
  //
  // const CategoryMealsScreen(this.categoryId, this.categoryTitle);
  static const String routeName = '/category-meals-screen';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var temp;
  var categoryTitle;
  late List<Meal> displayMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_loadedInitData) {
      if(!_loadedInitData){
        final RoutesAgrs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
        categoryTitle = RoutesAgrs['title'];
        final categoryId = RoutesAgrs['id'];
        displayMeals = widget.availableMeals.where((meal) {
          return meal.categories.contains(categoryId);
        }).toList();
        _loadedInitData = true;
      }

    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('$categoryTitle'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                displayMeals[index].id,
                displayMeals[index].title,
                displayMeals[index].imageUrl,
                displayMeals[index].duration,
                displayMeals[index].complexity,
                displayMeals[index].affordability);
          },
          itemCount: displayMeals.length,
        ));
  }
}
