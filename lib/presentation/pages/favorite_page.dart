import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/outlets.dart';
import 'package:laundry_app/presentation/widgets/horizontal_outlets_widget.dart';
import 'package:laundry_app/services/outlets_services.dart';

import '../widgets/header.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference favorites = firestore.collection('favorites');

  late String? userId = FirebaseAuth.instance.currentUser?.uid;
  late Query query = favorites.where('user_id', isEqualTo: userId);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            const Header(),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Text(
                "Favorite Outlets",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: StreamBuilder<QuerySnapshot>(
            stream: query.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.size != 0) {
                  return Column(
                      children: snapshot.data!.docs.map((e) {
                    Outlets outlet =
                        Outlets.fromJsonFav(e.data() as Map<String, dynamic>);
                    return HorizontalOutletsWidget(outlets: outlet);
                  }).toList());
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height -300,
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.favorite_rounded, color: primaryColor, size: 40,),
                        SizedBox(height: 10,),
                        Text("No favorite outlets", style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),));
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
