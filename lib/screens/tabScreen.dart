import 'package:flutter/material.dart';
import 'package:transaction_revise/screens/favScreen.dart';
import 'package:transaction_revise/screens/mainDrawer.dart';
import 'package:transaction_revise/screens/mealScreen.dart';

import '../data/meal.dart';

class TabScreen extends StatefulWidget {
  static const routeName = 'tabScreen';
  final List<Meal> favMeals;
  TabScreen(this.favMeals);
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  var selectedIndex = 0;
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      MealScreen(),
      FavScreen(widget.favMeals),
    ];
    return Scaffold(
      drawer: Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(title: Text("MealApp")),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: 'Meals', icon: Icon(Icons.food_bank)),
          BottomNavigationBarItem(label: 'Fav', icon: Icon(Icons.favorite)),
        ],
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
