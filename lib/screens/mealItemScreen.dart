import 'package:flutter/material.dart';
import 'package:transaction_revise/widgets/mealitem.dart';

import '../data/meal.dart';

class MealItemScreen extends StatelessWidget {
  static const routeName = 'mealItemScreen';

  final List<Meal> availMeals;
  MealItemScreen(this.availMeals);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final catId = routeArgs['catId'];
    final title = routeArgs['title'].toString();
    final selectedMeals = availMeals
        .where((element) => element.categories.contains(catId))
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: selectedMeals[index].id,
              title: selectedMeals[index].title,
              affordability: selectedMeals[index].affordability,
              complexity: selectedMeals[index].complexity,
              imageUrl: selectedMeals[index].imageUrl,
              duration: selectedMeals[index].duration);
        },
        itemCount: selectedMeals.length,
      ),
    );
  }
}
