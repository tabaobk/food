import 'package:flutter/material.dart';
import 'package:meal_appication/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final int complexity;
  final int affordability;

  const MealItem(
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability);

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,
        arguments:
            MealItem(id, title, imageUrl, duration, complexity, affordability));
  }

  String getComplexcity(int complexity) {
    switch (complexity) {
      case 0:
        return 'Simple';
      case 1:
        return 'Challenging';
      case 2:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String getAffordability(int affordability) {
    switch (affordability) {
      case 0:
        return 'Affordable';
      case 1:
        return 'Pricey';
      case 2:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      width: 300,
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      color: Colors.black54,
                      child: Text(
                        '$title',
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 6,
                      ),
                      Text(getComplexcity(complexity))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.monetization_on_outlined),
                      SizedBox(
                        width: 6,
                      ),
                      Text(getAffordability(affordability))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
