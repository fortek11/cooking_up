import 'package:flutter/material.dart';
import 'package:transaction_revise/screens/mainDrawer.dart';

class FilterScreen extends StatefulWidget {
  final Map<String, bool> filterss;
  final Function setFilters;
  FilterScreen(this.filterss, this.setFilters);
  static const routeName = 'filterscreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isVeg = false;
  bool isVegan = false;
  bool isLactoseFree = false;
  @override
  void initState() {
    isGlutenFree = widget.filterss['gluten']!;
    isLactoseFree = widget.filterss['lactose']!;
    isVeg = widget.filterss['veg']!;
    isVegan = widget.filterss['vegan']!;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
        ),
        body: Column(
          children: [
            SwitchListTile(
                activeColor: Color.fromARGB(255, 180, 139, 125),
                title: const Text(
                  'Is Gluten Free?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 123, 95, 85),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: const Text(
                  "Eat Gluten Free Food",
                  style: TextStyle(
                      color: Color.fromARGB(255, 209, 209, 209),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                value: isGlutenFree,
                onChanged: (value) {
                  setState(() {
                    isGlutenFree = value;
                  });
                  widget.setFilters({
                    'gluten': isGlutenFree,
                    'lactose': isLactoseFree,
                    'veg': isVeg,
                    'vegan': isVegan
                  });
                }),
            SwitchListTile(
                activeColor: const Color.fromARGB(255, 180, 139, 125),
                title: const Text(
                  'Is Lactose Free?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 123, 95, 85),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: const Text(
                  "Eat Lactose Free Food",
                  style: TextStyle(
                      color: Color.fromARGB(255, 209, 209, 209),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                value: isLactoseFree,
                onChanged: (value) {
                  setState(() {
                    isLactoseFree = value;
                  });
                  widget.setFilters({
                    'gluten': isGlutenFree,
                    'lactose': isLactoseFree,
                    'veg': isVeg,
                    'vegan': isVegan
                  });
                }),
            SwitchListTile(
                activeColor: Color.fromARGB(255, 180, 139, 125),
                title: const Text(
                  'Only Veg',
                  style: TextStyle(
                      color: Color.fromARGB(255, 123, 95, 85),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: const Text(
                  "Eat only Vegetarian Food",
                  style: TextStyle(
                      color: Color.fromARGB(255, 209, 209, 209),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                value: isVeg,
                onChanged: (value) {
                  setState(() {
                    isVeg = value;
                  });
                  widget.setFilters({
                    'gluten': isGlutenFree,
                    'lactose': isLactoseFree,
                    'veg': isVeg,
                    'vegan': isVegan
                  });
                }),
            SwitchListTile(
                activeColor: const Color.fromARGB(255, 180, 139, 125),
                title: const Text(
                  'Is Vegan?',
                  style: TextStyle(
                      color: Color.fromARGB(255, 123, 95, 85),
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                subtitle: const Text(
                  "Eat only Vegan Food",
                  style: TextStyle(
                      color: Color.fromARGB(255, 209, 209, 209),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                value: isVegan,
                onChanged: (value) {
                  setState(() {
                    isVegan = value;
                  });
                  widget.setFilters({
                    'gluten': isGlutenFree,
                    'lactose': isLactoseFree,
                    'veg': isVeg,
                    'vegan': isVegan
                  });
                }),
          ],
        ));
  }
}
