import 'package:flutter/material.dart';

import '../data/meal.dart';
import '../widgets/mealitem.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> _favMeals;
  FavScreen(this._favMeals);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return MealItem(
            id: _favMeals[index].id,
            title: _favMeals[index].title,
            affordability: _favMeals[index].affordability,
            complexity: _favMeals[index].complexity,
            imageUrl: _favMeals[index].imageUrl,
            duration: _favMeals[index].duration);
      },
      itemCount: _favMeals.length,
    );
  }
}
