import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  // const MainDrawer({super.key});

  void navigateTo(BuildContext ctx, path) {
    Navigator.of(ctx).pushNamed(path);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(icon, size: 26),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          tapHandler();
        },
      );
    }

    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).backgroundColor,
          child: Text(
            'Comming up!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushNamed(CategoriesScreen.routeName);
        }),
        buildListTile('Filters', Icons.settings, () {
          Navigator.of(context).pushNamed(FiltersScreen.routeName);
        }),
      ],
    );
  }
}
