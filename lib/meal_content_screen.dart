import 'package:flutter/material.dart';
import './bluePrints/category_meals.dart';

class MealContentScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  const MealContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as MealData;

    final id = routeArgs.id;
    final image = routeArgs.image;
    final title = routeArgs.title;
    final color = routeArgs.color;
    final content = routeArgs.content;
    final categ = routeArgs.categ;

    return Scaffold(
      appBar: AppBar(
        title: Text(categ),
        backgroundColor: color,
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 200,
            width: (MediaQuery.of(context).size.width) * 1,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      )),
    );
  }
}
