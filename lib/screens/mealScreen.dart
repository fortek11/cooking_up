import 'package:flutter/material.dart';
import 'package:transaction_revise/data/dummy_data.dart';
import 'package:transaction_revise/widgets/catitem.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children:
            dummyCategory.map((e) => CatItem(e.id, e.title, e.color)).toList());
  }
}
