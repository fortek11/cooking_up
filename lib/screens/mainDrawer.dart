import 'package:flutter/material.dart';
import 'package:transaction_revise/screens/filterScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 95),
          height: 200,
          color: const Color.fromARGB(255, 57, 32, 23),
          child: const ListTile(
            leading: Icon(
              Icons.food_bank_outlined,
              size: 50,
            ),
            title: Text(
              "Cooking Up!",
              style: TextStyle(
                  color: Color.fromARGB(255, 162, 140, 131),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
          leading: const Icon(Icons.fastfood_outlined),
          title: const Text(
            "Meals",
            style: TextStyle(
                color: Color.fromARGB(255, 162, 140, 131), fontSize: 20),
          ),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          onTap: () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          },
          title: const Text(
            "Settings",
            style: TextStyle(
                color: Color.fromARGB(255, 162, 140, 131), fontSize: 20),
          ),
        ),
      ],
    );
  }
}
