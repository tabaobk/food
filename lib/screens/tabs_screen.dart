import 'package:flutter/material.dart';
import 'package:meal_appication/screens/categories_screen.dart';
import 'package:meal_appication/screens/favorites_screen.dart';
import 'package:meal_appication/widgets/main_drawer.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals); // static const String routeName = '/tabs';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  late List<Map<String, dynamic>> _pages;

  @override
  initState() {
    print('----------------dđ');
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Favourite'}
    ];
    super.initState();
  }

  @override
  void didUpdateWidget(TabsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('${_pages[_selectedPageIndex]['title']}'),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 6,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank),
              label: 'Categories',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favourite',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedPageIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _selectPage,
        ),
      ),
    );
  }
}
