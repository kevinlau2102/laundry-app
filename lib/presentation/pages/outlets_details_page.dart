import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/outlets.dart';

class OutletsDetailsPage extends StatelessWidget {
  final Outlets outlets;
  const OutletsDetailsPage({super.key, required this.outlets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.favorite_border_rounded,
                size: 35,
                color: primaryColor,
                shadows: <Shadow>[
                  Shadow(color: Colors.black, blurRadius: 1.0)
                ],
              ),
              tooltip: 'Open shopping cart',
              onPressed: () {
                // handle the press
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
          leading: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10,),
              Container(
                height: 45,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: primaryColor),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,
                      color: Colors.white, size: 25),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06),
          children: [
            Column(
              children: [
                Container(
                  child: Image.asset('images/${outlets.imageUrl}', height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth),
                )
              ],
            )
          ]),
    );
  }
}
