import 'package:flutter/material.dart';
import 'package:movie_riverpod/presentation/screens/fav_movie_screen.dart';
import 'package:movie_riverpod/presentation/screens/home_screen.dart';
import 'package:movie_riverpod/presentation/screens/search_screen.dart';

class BottomTabScreen extends StatefulWidget {
  const BottomTabScreen({super.key});

  @override
  State<BottomTabScreen> createState() => _BottomNavbarScreenState();
}

List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
];

List<Widget> screens = const [
  HomeScreen(),
  SearchScreen(),
  FavMovieScreen(),
];

class _BottomNavbarScreenState extends State<BottomTabScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        enableFeedback: true,
        items: items,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        currentIndex: selectedIndex,
      ),
      body: screens[selectedIndex],
    );
  }
}
