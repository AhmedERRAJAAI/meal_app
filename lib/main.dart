import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/favorite_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_content_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromARGB(255, 239, 239, 239),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      routes: {
        '/': (ctx) => TabsScreen(),
        // CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(),
        MealContentScreen.routeName: (ctx) => MealContentScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        FavotiteScreen.routeName: (ctx) => FavotiteScreen(),
      },
      onUnknownRoute: (settings) {
        //displays when flutter failed to find a the given route (404)
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
