import 'package:flutter/material.dart';
import 'package:transaction_revise/data/dummy_data.dart';
import 'package:transaction_revise/data/meal.dart';
import 'package:transaction_revise/screens/filterScreen.dart';
import 'package:transaction_revise/screens/mealDetail.dart';
import 'package:transaction_revise/screens/mealItemScreen.dart';
import 'package:transaction_revise/screens/tabScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main(List<String> args) {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  List<Meal> favMeals = [];

  void toogleFav(String id, BuildContext context) {
    final selectedFavMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == id);

    if (favMeals.contains(selectedFavMeal)) {
      favMeals.removeWhere((element) => element.id == id);
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Removed From Fav!'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
    } else {
      favMeals.add(selectedFavMeal);
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Added As Fav!'),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
    }
  }

  bool isFav(String id) {
    return favMeals.any((element) => element.id == id);
  }

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'veg': false,
    'vegan': false
  };

  List<Meal> availMeals = DUMMY_MEALS;
  void setFilters(Map<String, bool> sfilters) {
    filters = sfilters;
    availMeals = DUMMY_MEALS.where((element) {
      if (filters['gluten'] == true && element.isGlutenFree == false) {
        return false;
      }
      if (filters['lactose'] == true && element.isLactoseFree == false) {
        return false;
      }
      if (filters['veg'] == true && element.isVegetarian == false) {
        return false;
      }
      if (filters['vegan'] == true && element.isVegan == false) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryTextTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.black, brightness: Brightness.dark)),
      home: TabScreen(favMeals),
      routes: {
        MealItemScreen.routeName: (context) => MealItemScreen(availMeals),
        MealDetail.routeName: (context) => MealDetail(toogleFav, isFav),
        FilterScreen.routeName: (context) => FilterScreen(filters, setFilters)
      },
    );
  }
}
