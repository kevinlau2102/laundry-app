import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/presentation/widgets/horizontal_outlets_widget.dart';
import 'package:laundry_app/services/outlets_services.dart';

import '../widgets/header.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
          child: Column(
              children: OutletsServices()
                  .getOutlets()
                  .map((e) => HorizontalOutletsWidget(outlets: e))
                  .toList()),
        ),
      ],
    );
  }
}
