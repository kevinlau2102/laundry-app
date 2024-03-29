import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/bloc/pages_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_app/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passController = TextEditingController(text: "");
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).viewPadding.top,
            child: Stack(
              children: [
                Column(
                  children: [
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
                        "Login to your account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF52B2CF),
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: 50,
                        child: TextField(
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
                      height: 20,
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
                      height: 30,
                    ),
                    BlocBuilder<PagesBloc, PagesState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: 165,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              user = await AuthServices.signIn(
                                  emailController.text, passController.text);
                              if (!mounted) return;
                              if (user != null) {
                                context
                                    .read<PagesBloc>()
                                    .add(const PagesEvent.started(0));
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Pages()),
                                // );
                                context.goNamed('home');
                              } else {
                                showNotification(
                                    context, "Invalid email or password");
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    const MaterialStatePropertyAll<Color>(
                                        Color(0xFFFFA928)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ))),
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        const Text(
                          "Be our laundry customer!",
                          style:
                              TextStyle(color: Color(0xFF52B2CF), fontSize: 16),
                        ),
                        SizedBox(
                          height: 30,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const SignUpPage()),
                                // );
                                context.goNamed('signup');
                              },
                              child: const Text("Sign up here",
                                  style: TextStyle(
                                      color: Color(0xFFFFA928), fontSize: 16))),
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: ClipPath(
                      clipper: WaveClipper(),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xFF52B2CF),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  "Or login with",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: const Icon(
                                              FontAwesomeIcons.facebook,
                                              color: Color(0xFF3B5998),
                                              size: 40,
                                            ))),
                                    Container(
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {},
                                            icon: Image.asset(
                                              'images/google-icon.png',
                                              fit: BoxFit.fill,
                                              width: 40,
                                            ))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message.toString())));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, 30);

    path.quadraticBezierTo(size.width / 5, 0.0, size.width / 1.75, 50);

    path.quadraticBezierTo(size.width - 60, 80, size.width, 60);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
