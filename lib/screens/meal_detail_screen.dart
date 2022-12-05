import 'package:flutter/material.dart';
import 'package:meal_appication/dummy_data.dart';
import '../widgets/meal_item.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-screen';
  final Function removeFavorite;
  final Function isFavorite;
  final Function addFavorite;

  MealDetailScreen(this.removeFavorite, this.addFavorite, this.isFavorite);

  Widget selectTitleMeal(BuildContext context, String temp) {
    return Container(
      padding: EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 20),
      child: Text(
        temp,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealItem = ModalRoute.of(context)?.settings.arguments as MealItem;
    final selectMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealItem.id);
    return Scaffold(
      appBar: AppBar(title: Text('${mealItem.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(selectMeal.imageUrl, fit: BoxFit.contain),
            ),
            selectTitleMeal(context, 'Ingredients'),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.amber, width: 1.0)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text('${selectMeal.ingredients[index]}'),
                    elevation: 5,
                  );
                },
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            selectTitleMeal(context, 'Steps'),
            Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.amber, width: 1.0)),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemBuilder: (BuildContext, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.brown.shade50,
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(
                          '${selectMeal.steps[index]}',
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectMeal.steps.length,
              ),
            ),
            FloatingActionButton(
              child: Icon(
                isFavorite(mealItem.id) ? Icons.star : Icons.star_border,
              ),
              onPressed: () {
                if (isFavorite(mealItem.id)) {
                  removeFavorite(mealItem.id);
                } else {
                  addFavorite(mealItem.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
