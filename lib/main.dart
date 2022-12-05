import 'dart:ui';
import 'package:meal_appication/dummy_data.dart';
import 'package:meal_appication/screens/filter_screen.dart';
import 'package:meal_appication/screens/meal_detail_screen.dart';
import 'package:meal_appication/screens/tabs_screen.dart';
import 'models/meals.dart';
import 'screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _toggleFavourite(String mealID) {
    final favourite = _favoriteMeals;
    final a = favourite.firstWhere((element) => element.id == mealID);
    favourite.remove(a);

    setState(() {
      _favoriteMeals = favourite;
      print('length = ${_favoriteMeals.length}');
    });
  }

  _addFavourite(String mealID) {
    setState(() {
      _favoriteMeals
          .add(DUMMY_MEALS.firstWhere((element) => element.id == mealID));
    });
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('---------------------- ');
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: (Colors.yellow),
        accentColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 250, 210, 3),
        fontFamily: 'Raleway',
      ),
      //home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavourite, _addFavourite, _isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters)
      },
    );
  }
}
