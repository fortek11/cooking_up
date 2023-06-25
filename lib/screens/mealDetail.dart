import 'package:flutter/material.dart';
import 'package:transaction_revise/data/dummy_data.dart';
import 'package:transaction_revise/data/meal.dart';

class MealDetail extends StatefulWidget {
  final Function toogleFav;
  final Function isFav;

  MealDetail(this.toogleFav, this.isFav);
  static const routeName = 'mealdetail';

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    Meal selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == id,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.toogleFav(id, context);
                });
              },
              icon: widget.isFav(id) == false
                  ? Icon(
                      Icons.star_border_outlined,
                      color: Colors.brown,
                    )
                  : Icon(
                      Icons.star,
                      color: Colors.brown,
                    ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              'Ingredients',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown),
                  child: ListTile(
                    title: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(color: Color.fromARGB(255, 27, 15, 11)),
                    ),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.brown),
                  child: ListTile(
                    leading: Text('${index + 1}.'),
                    title: Text(
                      selectedMeal.steps[index],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 27, 15, 11)),
                    ),
                    trailing: const Icon(
                      Icons.light_mode_sharp,
                      color: Color.fromARGB(255, 27, 15, 11),
                    ),
                  ),
                );
              },
              itemCount: selectedMeal.steps.length,
            ),
          ],
        ),
      ),
    );
  }
}
