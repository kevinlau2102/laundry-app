import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/order.dart';
import 'package:laundry_app/presentation/widgets/header.dart';

class CompletedOrderPage extends StatelessWidget {
  final Order order;
  const CompletedOrderPage({super.key, required this.order});

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
                          Navigator.pop(context);
                          // context.goNamed('history');
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "Completed Order",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Order Details",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(left: 15, right: 25, top: 10),
                      alignment: Alignment.topLeft,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: primaryColor)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: const Icon(
                                        Icons.scale_rounded,
                                        size: 40,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text("Weight",
                                        style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                              Text(
                                "${order.weight} Kg",
                                style: GoogleFonts.inter(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: const Icon(
                                        Icons.timelapse_rounded,
                                        size: 40,
                                        color: secondaryColor,
                                      ),
                                    ),
                                    Text("Status",
                                        style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                              Text(
                                order.status,
                                style: GoogleFonts.inter(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Icon(
                                        Icons.location_on,
                                        size: 40,
                                        color: Colors.red.shade400,
                                      ),
                                    ),
                                    Text("Location",
                                        style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    order.outlets.name,
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    order.outlets.address,
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 60,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Icon(
                                        Icons.attach_money_rounded,
                                        size: 40,
                                        color: Colors.green.shade400,
                                      ),
                                    ),
                                    Text("Total",
                                        style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id',
                                            symbol: 'Rp ',
                                            decimalDigits: 0)
                                        .format(
                                      order.price,
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    order.payment,
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Order Time: ${order.orderTime}",
                      style: GoogleFonts.inter(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              "Rated: ${order.rated.toStringAsFixed(0)}",
                              style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Icon(
                            Icons.star_rate_rounded,
                            color: accentColor,
                            size: 25,
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
