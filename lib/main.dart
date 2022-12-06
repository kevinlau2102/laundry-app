import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/presentation/pages/login_page.dart';
import 'package:laundry_app/presentation/widgets/ads_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: LoginPage(),
    );
  }
}
