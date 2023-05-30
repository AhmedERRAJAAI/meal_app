import 'package:flutter/material.dart';
import './meal_content_screen.dart';
import './bluePrints/category_meals.dart';

class MealCard extends StatefulWidget {
  // const MealCard({super.key});

  final String id;
  final String mealImage;
  final String mealTitle;
  final String mealContent;
  final String categ;
  final Color categoryColor;

  MealCard({
    required this.id,
    required this.mealImage,
    required this.mealTitle,
    required this.mealContent,
    required this.categ,
    required this.categoryColor,
  });
  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  var isFav = false; //should be outside of the build function

  void navigateTo(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealContentScreen.routeName,
        arguments: MealData(
          id: widget.id,
          image: widget.mealImage,
          title: widget.mealTitle,
          color: widget.categoryColor,
          content: widget.mealContent,
          categ: widget.categ,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 40),
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
            onTap: () => navigateTo(context),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 240,
              ),
              child: Image(image: AssetImage(widget.mealImage)),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant_menu_rounded,
              size: 30,
            ),
            trailing: InkWell(
              onTap: () {
                setState(() {
                  isFav = !isFav;
                });
                print(isFav);
              },
              child: Icon(
                Icons.favorite,
                color: isFav ? Colors.red : Colors.grey,
                size: 30,
              ),
            ),
            title: Text(widget.mealTitle),
          ),
          Container(
            height: 5,
            color: widget.categoryColor,
          )
        ],
      ),
    );
    ;
  }
}
