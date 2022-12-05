import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meal_appication/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = 'filters-screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }


  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, dynamic updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
             tooltip: 'Saved' ,

          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Saved"),
            ));
            // Fluttertoast.showToast(
            //     msg: "This is Center Short Toast",
            //     toastLength: Toast.LENGTH_SHORT,
            //     gravity: ToastGravity.CENTER,
            //     timeInSecForIosWeb: 1,
            //     backgroundColor: Colors.red,
            //     textColor: Colors.white,
            //     fontSize: 16.0
            // );
            final selectedFilters =  {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,

            };
            widget.saveFilters(selectedFilters);
          }, icon: Icon(Icons.save))
        ],
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust meal selection.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'gluten-free', 'Only include gluten-meal', _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'lactose-free', 'Only include lactose-meal', _lactoseFree,
                  (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile(
                  'vegetarian', 'Only include vegetarian-meal', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile('vegan', 'Only include vegan', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
