import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/order.dart' as order2;
import 'package:laundry_app/presentation/widgets/header.dart';

class CompletedOrderPage extends StatefulWidget {
  final order2.Order order;
  const CompletedOrderPage({super.key, required this.order});

  @override
  State<CompletedOrderPage> createState() => _CompletedOrderPageState();
}

class _CompletedOrderPageState extends State<CompletedOrderPage> {
  int _rating = 0;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orders = firestore.collection("orders");

  IconData? _selectedIcon;
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
                                "${widget.order.weight} Kg",
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
                                widget.order.status.toString(),
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
                                      widget.order.outlets!.name.toString(),
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
                                      widget.order.outlets!.address.toString(),
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
                                      widget.order.price,
                                    ),
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.order.payment.toString(),
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
                      "Order Date: ${DateFormat('EEE, d MMMM y, H:mm').format(widget.order.orderTime!.toDate())}",
                      style: GoogleFonts.inter(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<DocumentSnapshot>(
                      stream: orders.doc(widget.order.id).snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          order2.Order ratedOrder = order2.Order.fromJson(
                              snapshot.data!.data() as Map<String, dynamic>);
                          return Column(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                          "Rated: ${ratedOrder.rated!.toStringAsFixed(0)}",
                                          style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.star_rate_rounded,
                                        color: accentColor,
                                        size: 25,
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              ratedOrder.rated == 0 ?
                              Column(
                                children: [
                                  Text(
                                    "How was the laundry?",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RatingBar.builder(
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    unratedColor: Colors.amber.withAlpha(50),
                                    itemCount: 5,
                                    itemSize: 50.0,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      _selectedIcon ?? Icons.star_rounded,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        _rating = rating.toInt();
                                      });
                                    },
                                    updateOnDrag: true,
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1,
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: _rating == 0
                                          ? null
                                          : () async {
                                              await orders
                                                  .doc(widget.order.id)
                                                  .update({'rated': _rating});
                                            },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                                  _rating == 0
                                                      ? Colors.grey.shade300
                                                      : accentColor),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ))),
                                      child: const Text(
                                        "Done",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ) : const SizedBox(),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
