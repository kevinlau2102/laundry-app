import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/bloc/pages_bloc.dart';
import 'package:laundry_app/presentation/pages/ads_page.dart';
import 'package:laundry_app/presentation/pages/change_address_page.dart';
import 'package:laundry_app/presentation/pages/favorite_page.dart';
import 'package:laundry_app/presentation/pages/history_page.dart';
import 'package:laundry_app/presentation/pages/home_page.dart';
import 'package:laundry_app/presentation/pages/login_page.dart';
import 'package:laundry_app/presentation/pages/pages.dart';
import 'package:laundry_app/presentation/pages/profile_page.dart';
import 'package:laundry_app/presentation/pages/search_page.dart';
import 'package:laundry_app/presentation/pages/signup_page.dart';
import 'package:laundry_app/presentation/pages/signup_page_2.dart';
import 'package:laundry_app/presentation/widgets/ads_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            return const LoginPage();
          },
          routes: [
            GoRoute(
              path: 'signup',
              name: 'signup',
              builder: (context, state) {
                return const SignUpPage();
              },
              routes: [
                GoRoute(
                  path: 'signup2',
                  name: 'signup2',
                  builder: (context, state) {
                    return const SignUpPage2();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) {
            return Pages();
          },
          routes: [
            GoRoute(
              path: 'ads',
              name: 'ads',
              builder: (context, state) {
                return const AdsPage();
              },
            ),
            GoRoute(
              path: 'search',
              name: 'search',
              builder: (context, state) {
                return const SearchPage();
              },
            ),
            GoRoute(
              path: 'favorite',
              name: 'favorite',
              builder: (context, state) {
                return const FavoritePage();
              },
            ),
            GoRoute(
              path: 'history',
              name: 'history',
              builder: (context, state) {
                return const FavoritePage();
              },
            ),
            GoRoute(
              path: 'profile',
              name: 'profile',
              builder: (context, state) {
                return const ProfilePage();
              },
              routes: [
                GoRoute(
                  path: 'history',
                  name: 'history',
                  builder: (context, state) {
                    return const HistoryPage();
                  },
                ),
                GoRoute(
                  path: 'change_address',
                  name: 'change_address',
                  builder: (context, state) {
                    return const ChangeAddressPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      initialLocation:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/home');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PagesBloc()..add(const PagesEvent.started(0)),
      // child: const MaterialApp(
      //   title: 'Flutter Demo',
      //   debugShowCheckedModeBanner: false,
      //   home: LoginPage(),
      // ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
      ),
    );
  }
}
