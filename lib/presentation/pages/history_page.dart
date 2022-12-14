import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/presentation/widgets/header.dart';
import 'package:laundry_app/presentation/widgets/history_outlets_widget.dart';
import 'package:laundry_app/presentation/widgets/horizontal_outlets_widget.dart';
import 'package:laundry_app/services/order_services.dart';
import 'package:laundry_app/services/outlets_services.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                          // Navigator.pop(context);
                          context.goNamed('profile');
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "History Order",
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Flexible(
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              children: OrderServices()
                  .getOrders()
                  .map((e) => HistoryOutletsWidget(order: e))
                  .toList(),
            ))
          ],
        ),
      ),
    );
  }
}
