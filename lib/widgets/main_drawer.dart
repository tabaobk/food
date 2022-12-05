import 'package:flutter/material.dart';
import 'package:meal_appication/screens/filter_screen.dart';
import 'package:meal_appication/screens/tabs_screen.dart';

import '../screens/category_meals_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, Icon icon, dynamic tap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(),
      ),
      onTap: tap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            padding: EdgeInsets.only(left: 30, top: 20, right: 0, bottom: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Meal!',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            width: double.infinity,

            height: 20,
          ),
          buildListTile('Meal', Icon(Icons.restaurant), () { return Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile('Setting', Icon(Icons.settings), () {return Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);})
        ],
      ),
    );
  }
}
