import 'package:flutter/material.dart';
import 'package:transaction_revise/screens/mealItemScreen.dart';

class CatItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CatItem(
    this.id,
    this.title,
    this.color,
  );
  void openCatScreen(String catId, String title, BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealItemScreen.routeName, arguments: {
      'catId': catId,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: color,
      onTap: () {
        openCatScreen(id, title, context);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
