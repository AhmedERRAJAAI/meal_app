import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';

import '../bluePrints/category_meals.dart';
import '../widgets/meal_card.dart';
import '../models/category.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  // const CategoryMealScreen({super.key});
  late String catergoryTitle;
  late String catergoryId;
  late Color catergoryColor;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments as MealsArgs;
      catergoryId = routeArgs.id;
      catergoryTitle = routeArgs.title;
      catergoryColor = routeArgs.color;

      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categId.contains(catergoryId);
      }).toList();
      _loadedInitData = true;
      // super.initState();
    }
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context)?.settings.arguments as MealsArgs;
    // catergoryId = routeArgs.id;
    // catergoryTitle = routeArgs.title;
    // catergoryColor = routeArgs.color;
    // displayedMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categId.contains(catergoryId);
    // }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(catergoryTitle.toString()),
          backgroundColor: catergoryColor,
        ),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: displayedMeals.map((meal) {
            return MealCard(
              mealImage: meal.imageUrl,
              mealTitle: meal.title,
              categoryColor: catergoryColor,
              id: meal.id,
              mealContent: meal.content,
              removeMeal: removeMeal,
              categ: catergoryTitle.toString(),
            );
          }).toList(),
        ));
  }
}
