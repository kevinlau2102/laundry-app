import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/order.dart';
import 'package:laundry_app/presentation/widgets/google_maps_widget.dart';
import 'package:laundry_app/presentation/widgets/header.dart';

class OngoingOrderPage extends StatelessWidget {
  final Order order;
  const OngoingOrderPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  margin: const EdgeInsets.only(top: 100),
                  child: GoogleMapsWidget(latitude: order.outlets!.latitude!, longitude: order.outlets!.longitude!,),
                ),
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
                        "On-going order",
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(children: [
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
                              order.status.toString(),
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
                            const SizedBox(width: 30),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    order.outlets!.name.toString(),
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    order.outlets!.address.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.inter(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
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
                                  order.payment.toString(),
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
                      "Order Date: ${DateFormat('EEE, d MMMM y, H:mm').format(order.orderTime!.toDate())}",
                      style: GoogleFonts.inter(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
