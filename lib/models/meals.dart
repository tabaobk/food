import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }
// enum Complexity {
//   Simple, 0
//   Challenging, 1
//   Hard 2
// }
//
// enum Affordability {
//   Affordable,0
//   Pricey, 1
//   Luxurious 2
// }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final int affordability;
  final int complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      @required this.id,
      @required this.categories,
      @required this.title,
      @required this.affordability,
      @required this.complexity,
      @required this.imageUrl,
      @required this.duration,
      @required this.ingredients,
      @required this.steps,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian);
}
