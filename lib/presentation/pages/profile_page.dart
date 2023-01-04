import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/presentation/pages/login_page.dart';
import 'package:laundry_app/services/auth_services.dart';
import 'package:laundry_app/entities/user.dart' as user2;

import '../widgets/header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late user2.User userEnt;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCol = firestore.collection("user");

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
                "Profile",
                style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Column(
          children: [
            Stack(
              children: [
                const Icon(
                  Icons.account_circle,
                  color: Color(0xFF5C8899),
                  size: 120,
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: accentColor),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        )))
              ],
            ),
            FutureBuilder(
                future:
                    usersCol.doc(FirebaseAuth.instance.currentUser?.uid).get(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    userEnt = user2.User.fromJson(snapshot.data!.data() as Map<String, dynamic>);
                    return Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              (userEnt.name).toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )),
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              (userEnt.phone).toString(),
                              style: const TextStyle(fontSize: 16),
                            )),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            (userEnt.email).toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
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
                })),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HistoryPage()),
                // );
                context.goNamed('history');
              },
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border(
                        top:
                            BorderSide(width: 2, color: Colors.grey.shade300))),
                child: Row(children: [
                  Image.asset("images/history.png",
                      height: 40, color: primaryColor),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "History",
                    style: TextStyle(fontSize: 16),
                  )
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                // builder: (context) => const ChangeAddressPage()),
                // );
                context.goNamed('change_address');
              },
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(width: 2, color: Colors.grey.shade300))),
                child: Row(children: const [
                  Icon(Icons.location_on, size: 40, color: primaryColor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Change Address",
                    style: TextStyle(fontSize: 16),
                  )
                ]),
              ),
            ),
            GestureDetector(
              onTap: _showDialog,
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 2, color: Colors.grey.shade300))),
                child: Row(children: [
                  Image.asset("images/icons8-log-out-50.png",
                      width: 35, color: primaryColor),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 16),
                  )
                ]),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: IntrinsicWidth(
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Confirmation",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto",
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Are you sure want to log out?",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.grey.shade300),
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.grey.shade300))),
                            child: TextButton(
                              onPressed: () async {
                                // Navigator.of(context)
                                //     .popUntil((route) => route.isFirst);
                                await AuthServices.signOut();
                                if (!mounted) return;
                                context.goNamed('login');
                              },
                              child: const Text(
                                "Log out now",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              "No, I'll stay",
                              style: TextStyle(color: tertiaryColor),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
