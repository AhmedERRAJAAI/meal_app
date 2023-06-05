import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorite_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    FavotiteScreen(),
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          backgroundColor: Theme.of(context).primaryColor,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        drawer: Drawer(child: MainDrawer()),
        // body: const TabBarView( // USED WITH THE TOP NAVIGATION BAR
        //   children: <Widget>[
        //     CategoriesScreen(),
        //     FavotiteScreen(),
        //   ],
        // ),
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 45, 45, 45),
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                label: 'Categories',
                // tooltip: 'tab1',
                backgroundColor: Theme.of(context).primaryColor,
                icon: const Icon(Icons.category)),
            BottomNavigationBarItem(
              label: 'Favorites',
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.favorite),
            ),
          ],
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
