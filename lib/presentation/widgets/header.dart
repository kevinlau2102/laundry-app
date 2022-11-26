import 'package:flutter/material.dart';
import 'package:laundry_app/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        height: 120,
        color: primaryColor,
        
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 25);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height - 25);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height - 50,
        size.width, size.height - 25);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
