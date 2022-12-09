import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/colors.dart';

import '../widgets/header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: const Text(
                  "John Doe",
                  style: TextStyle(fontSize: 18),
                )),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: const Text(
                  "+628-221-234-567",
                  style: TextStyle(fontSize: 14),
                )),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: const Text(
                  "johndoe@gmail.com",
                  style: TextStyle(fontSize: 14),
                )),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 2, color: Colors.grey.shade300))),
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
              onTap: () {},
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
              onTap: () {
                
              },
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
}
