import 'package:flutter/material.dart';
import '../screens/meal_content_screen.dart';
import '../bluePrints/category_meals.dart';

class MealCard extends StatefulWidget {
  final String id;
  final String mealImage;
  final String mealTitle;
  final String mealContent;
  final String categ;
  final Color categoryColor;
  final Function removeMeal;

  MealCard({
    required this.id,
    required this.mealImage,
    required this.mealTitle,
    required this.mealContent,
    required this.categ,
    required this.categoryColor,
    required this.removeMeal,
  });
  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  var isFav = false; //should be outside of the build function

  void navigateTo(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealContentScreen.routeName,
            arguments: MealData(
              id: widget.id, //we use the widget object with the statefullwidget
              image: widget.mealImage,
              title: widget.mealTitle,
              color: widget.categoryColor,
              content: widget.mealContent,
              categ: widget.categ,
            ))
        .then((result) {
      if (result != null) {
        widget.removeMeal(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 40),
      clipBehavior: Clip.antiAlias,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(widget.mealImage),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      widget.mealTitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white,
                        wordSpacing: 3,
                      ),
                    ),
                  )
                ],
              ),
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
              },
              child: Icon(
                Icons.favorite,
                color: isFav ? Colors.red : Colors.grey.withOpacity(0.5),
                size: 30,
              ),
            ),
            title: Text(widget.mealContent, maxLines: 1),
          ),
          Container(
            height: 5,
            color: widget.categoryColor,
          )
        ],
      ),
    );
  }
}
