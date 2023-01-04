import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/colors.dart';

class AdsWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  const AdsWidget({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed("ads");
      },
      child: Container(
        height: 140,
        width: 140,
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/$imageUrl',
                // width: 300,
                height: 105,
                fit: BoxFit.fitHeight),
            const SizedBox(height: 10),
            Text(title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12))
          ],
        ),
      ),
    );
  }
}
