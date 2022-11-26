import 'package:flutter/material.dart';
import 'package:laundry_app/presentation/pages/favorite_page.dart';
import 'package:laundry_app/presentation/pages/home_page.dart';
import 'package:laundry_app/presentation/pages/profile_page.dart';
import 'package:laundry_app/presentation/pages/search_page.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _index = 0;

  final List<Widget> _children = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _children.elementAt(_index),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            selectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: const Color(0xFF52B2CF),
            onTap: _onItemTapped,
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}
