import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/bloc/pages_bloc.dart';
import 'package:laundry_app/colors.dart';

class OrderConfirmedPage extends StatelessWidget {
  const OrderConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: const EdgeInsets.all(40),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(
                  Icons.check_rounded,
                  size: 100,
                  color: primaryColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                alignment: Alignment.center,
                child: Text(
                  "Your order has been confirmed",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ]),
            BlocBuilder<PagesBloc, PagesState>(
              builder: (context, state) {
                return Positioned(
                  bottom: 100,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<PagesBloc>()
                            .add(const PagesEvent.started(0));
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color(0xFFFFA928)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      child: Text(
                        "Return to home",
                        style: GoogleFonts.inter(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
