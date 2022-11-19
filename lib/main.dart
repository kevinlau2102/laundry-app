import 'package:flutter/material.dart';
import 'package:laundry_app/presentation/pages/login_view.dart';
import 'package:laundry_app/presentation/pages/signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}