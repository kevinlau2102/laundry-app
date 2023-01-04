import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");
  TextEditingController fNameController = TextEditingController(text: "");
  TextEditingController lNameController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  String? name;
  String temp = "Temp Data";
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCol = firestore.collection('user');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'images/LogoDraft1_1.png',
                  fit: BoxFit.fill,
                  width: 205,
                )),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text(
                "Create an account:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF52B2CF),
                    fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: fNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'First Name',
                      hintText: 'First Name'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: lNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Last Name',
                      hintText: 'Last Name'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Email',
                      hintText: 'Email'),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                    controller: passController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: "Password",
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Phone',
                      hintText: 'Phone'),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Color(0xFF52B2CF), fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        // Navigator.pop(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const LoginPage()),
                        // );
                        context.goNamed('login');
                      },
                      child: const Text("Sign in",
                          style: TextStyle(
                              color: Color(0xFFFFA928), fontSize: 16))),
                )
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Color(0xFFFFA928)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    onPressed: () async {
                      name =
                          ("${fNameController.text.toString().trim()} ${lNameController.text.toString().trim()}");
                      try {
                        final User? userEnt =
                            (await _auth.createUserWithEmailAndPassword(
                                    email: (emailController.text.trim()),
                                    password: (passController.text.trim())))
                                .user;
                        if (userEnt != null) {
                          createData(name!, emailController.text,
                              phoneController.text, userEnt, temp);
                        }
                      } on FirebaseAuthException catch (e) {
                        showNotif(context, e.message.toString());
                        fNameController.text = "";
                        lNameController.text = "";
                        emailController.text = "";
                        passController.text = "";
                        phoneController.text = "";
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const SignUpPage2()),
                      // );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Text('Next'),
                        SizedBox(
                          width: 20,
                          child: Icon(
                            Icons.keyboard_arrow_right,
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ])
        ],
      ),
    );
  }

  void showNotif(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: secondaryColor, content: Text(message.toString())),
    );
  }

  void createData(
      String name, String email, String phone, User? user, String tempData) {
    userCol.doc(user?.uid).set({
      "name": name.trim(),
      "email": email.trim(),
      "phone": phone.trim(),
      "address": tempData,
      "city": tempData,
      "postal": tempData,
      "province": tempData,
    }).then((value) =>
        context.goNamed('signup2', params: {'uid': (user?.uid).toString()}));
  }
}
