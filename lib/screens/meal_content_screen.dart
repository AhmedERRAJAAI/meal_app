import 'package:flutter/material.dart';
import '../bluePrints/category_meals.dart';

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
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: (MediaQuery.of(context).size.width) * 1,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
