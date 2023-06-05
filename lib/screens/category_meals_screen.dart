import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';

import '../bluePrints/category_meals.dart';
import '../widgets/meal_card.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  // const CategoryMealScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as MealsArgs;

    final categoryID = routeArgs.id;
    final categoryTitle = routeArgs.title;
    final categoryColor = routeArgs.color;

    final meals = DUMMY_MEALS.where((meal) {
      return meal.categId.contains(categoryID);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
          backgroundColor: categoryColor,
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: meals.map((meal) {
            return MealCard(
                mealImage: meal.imageUrl,
                mealTitle: meal.title,
                categoryColor: categoryColor,
                id: meal.id,
                mealContent: meal.content,
                categ: categoryTitle.toString());
          }).toList(),
        ));
  }
}
