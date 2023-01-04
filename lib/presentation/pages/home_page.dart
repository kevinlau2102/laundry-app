import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/bloc/pages_bloc.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/presentation/widgets/ads_widget.dart';
import 'package:laundry_app/entities/user.dart' as user2;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late user2.User userEnt;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCol = firestore.collection("user");

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height / 7,
            color: primaryColor,
            child: Column(
              children: [
                BlocBuilder<PagesBloc, PagesState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address:',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  FutureBuilder(
                                      future: usersCol
                                          .doc(FirebaseAuth
                                              .instance.currentUser?.uid)
                                          .get(),
                                      builder: ((context, snapshot) {
                                        if (snapshot.hasData) {
                                          userEnt = user2.User.fromJson(
                                              snapshot.data!.data()
                                                  as Map<String, dynamic>);
                                          return Text(
                                            (userEnt.address).toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13),
                                          );
                                        } else {
                                          return Text(
                                            "..LOADING..",
                                            style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13),
                                          );
                                        }
                                      }))
                                ],
                              )
                            ],
                          ),
                          Center(
                            child: IconButton(
                              onPressed: () => context
                                  .read<PagesBloc>()
                                  .add(const PagesEvent.started(3)),
                              icon: const Icon(
                                Icons.account_circle,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<PagesBloc, PagesState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "On-going order",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: 165,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor)),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Icon(
                            Icons.local_laundry_service,
                            size: 50,
                            color: secondaryColor,
                          ),
                        ),
                        const Text(
                          "There is no on-going order",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: tertiaryColor),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<PagesBloc>()
                                  .add(const PagesEvent.started(1));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll<Color>(
                                        accentColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                            child: const Text(
                              "Find Outlets",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Category",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 165,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 35,
                                    right: -30,
                                    child: Transform.rotate(
                                        angle: -10 * pi / 180,
                                        child: Image.asset(
                                          "images/shirt.png",
                                          width: 90,
                                        ))),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Wash",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "and",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Dry Clean",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: tertiaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 35,
                                    right: -10,
                                    child: Image.asset(
                                      "images/setrika.png",
                                      width: 100,
                                    )),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Full Service",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    children: const [
                      AdsWidget(
                          imageUrl: "ads1.png", title: "20% off first order!"),
                      AdsWidget(
                          imageUrl: "ads2.png", title: "What is laundry?"),
                      AdsWidget(
                          imageUrl: "ads1.png", title: "20% off first order!"),
                      AdsWidget(
                          imageUrl: "ads2.png", title: "What is laundry?"),
                      AdsWidget(imageUrl: "ads1.png", title: "TESTING?"),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(10, size.height - 20, 30, size.height - 20);
    path.lineTo(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        size.width - 10, size.height - 20, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
