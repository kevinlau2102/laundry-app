import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/colors.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Stack(
            children: [
              Container(
                color: primaryColor,
                height: 80,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                        context.goNamed('home');
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Article",
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "What is Laundry?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/ads2.png",
                      height: 190,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                    "Laundry refers to the washing of clothing and other textiles, and, more broadly, their drying and ironing as well. Laundry has been part of history since humans began to wear clothes, so the methods by which different cultures have dealt with this universal human need are of interest to several branches of scholarship. Laundry work has traditionally been highly gendered, with the responsibility in most cultures falling to women (formerly known as laundresses or washerwomen).\n"),
                const Text(
                    "The Industrial Revolution gradually led to mechanized solutions to laundry work, notably the washing machine and later the tumble dryer. Laundry, like cooking and child care, is still done both at home and by commercial establishments outside the home.")
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
