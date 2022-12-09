import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry_app/bloc/pages_bloc.dart';
import 'package:laundry_app/presentation/pages/favorite_page.dart';
import 'package:laundry_app/presentation/pages/home_page.dart';
import 'package:laundry_app/presentation/pages/profile_page.dart';
import 'package:laundry_app/presentation/pages/search_page.dart';

class Pages extends StatelessWidget {
  Pages({super.key});

  final List<Widget> _children = [
    const HomePage(),
    const SearchPage(),
    const FavoritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<PagesBloc, PagesState>(
          builder: (context, state) {
            return Center(
              child: _children
                  .elementAt(state.when(initial: () => 0, running: (id) => id)),
            );
          },
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BlocBuilder<PagesBloc, PagesState>(
            builder: (context, state) {
              return BottomNavigationBar(
                selectedFontSize: 12,
                type: BottomNavigationBarType.fixed,
                currentIndex: state.when(initial: () => 0, running: (id) => id),
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
                onTap: (int index) {
                  context.read<PagesBloc>().add(PagesEvent.started(index));
                }
              );
            },
          ),
        ));
  }
}
