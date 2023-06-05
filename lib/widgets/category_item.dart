import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

import '../bluePrints/category_meals.dart';

class CategoryItem extends StatelessWidget {
  //used to send data across named route
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id, this.title, this.color);

  void selectCategpry(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealScreen(categoryTitle: title, categoryID: id,categoryColor: color,);
    // }));
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
        arguments: MealsArgs(id: id, title: title, color: color));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategpry(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
