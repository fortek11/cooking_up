import 'package:flutter/material.dart';
import 'package:transaction_revise/data/meal.dart';
import 'package:transaction_revise/screens/mealDetail.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  MealItem(
      {required this.id,
      required this.title,
      required this.affordability,
      required this.complexity,
      required this.imageUrl,
      required this.duration});

  String get afford {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Not Stated';
    }
  }

  String get complex {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        return 'Not Stated';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        selectMeal(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          color: Colors.black,
          shadowColor: Colors.brown,
          margin: const EdgeInsets.all(5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 10,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              FittedBox(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined),
                      Text(
                        duration.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money_outlined),
                      Text(
                        afford,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.key_sharp),
                      Text(
                        complex.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
