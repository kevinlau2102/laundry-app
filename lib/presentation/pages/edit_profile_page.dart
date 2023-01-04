import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/user.dart' as user2;
import 'package:laundry_app/presentation/widgets/header.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference usersCol = firestore.collection("user");

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                const Header(),
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
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "Edit Profile",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.account_circle,
              color: Color(0xFF5C8899),
              size: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<DocumentSnapshot>(
                future:
                    usersCol.doc(FirebaseAuth.instance.currentUser?.uid).get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    user2.User user = user2.User.fromJson(snapshot.data!.data() as Map<String, dynamic>);
                    firstNameController.text = user.firstName.toString();
                    lastNameController.text = user.lastName.toString();
                    phoneController.text = user.phone.toString();
                    emailController.text = user.email.toString();
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Text(
                            "First Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF52B2CF),
                                fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  hintText: 'first name'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Text(
                            "Last Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF52B2CF),
                                fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              controller: lastNameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
           
                                  hintText: 'Postal Code'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Text(
                            "Phone",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF52B2CF),
                                fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: phoneController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  hintText: 'phone'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF52B2CF),
                                fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              enabled: false,
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  hintText: 'Email'),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  await usersCol.doc(FirebaseAuth.instance.currentUser?.uid).update({
                    'first_name' : firstNameController.text.trim(),
                    'last_name' : lastNameController.text.trim(),
                    'phone' : phoneController.text.trim(),
                    'email' : emailController.text.trim()
                  }).then((value) => Navigator.of(context).pop());
                  
                },
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color(0xFFFFA928)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                child: const Text(
                  "Save Address",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
