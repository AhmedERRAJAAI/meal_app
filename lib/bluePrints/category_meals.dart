import 'package:flutter/material.dart';

class MealsArgs {
  //this class is blueprint of the object sent via the meals category route
  final String id;
  final String title;
  final Color color;

  MealsArgs({required this.id, required this.title, required this.color});
}

class MealData {
  //this class is blueprint of the object sent via the meals category route
  final String id;
  final String image;
  final String title;
  final String content;
  final String categ;
  final Color color;

  MealData(
      {required this.image,
      required this.id,
      required this.title,
      required this.color,
      required this.content,
      required this.categ});
}
