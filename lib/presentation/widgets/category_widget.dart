import 'package:flutter/material.dart';
import 'package:laundry_app/colors.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primaryColor)),
      child: Center(
          child: Text(
        category,
        style: const TextStyle(color: primaryColor, fontWeight: FontWeight.w600, fontSize: 14),
      )),
    );
  }
}
