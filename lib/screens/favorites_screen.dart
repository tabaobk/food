import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    print('lenght ${favoriteMeals.length}');
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            favoriteMeals[index].id,
            favoriteMeals[index].title,
            favoriteMeals[index].imageUrl,
            favoriteMeals[index].duration,
            favoriteMeals[index].affordability,
            favoriteMeals[index].complexity,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}