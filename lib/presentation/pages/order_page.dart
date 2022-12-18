import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/outlets.dart';
import 'package:laundry_app/presentation/widgets/labeled_radio.dart';
import 'package:laundry_app/presentation/pages/order_confirmed_page.dart';

import '../widgets/google_maps_widget.dart';

class OrderPage extends StatefulWidget {
  final Outlets outlets;
  const OrderPage({super.key, required this.outlets});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String _isOrderTypeSelected = "Pickup order";
  String _isServiceSelected = "Wash and Dry Clean (3 Days)";
  String _isPaymentSelected = "Debit / Credit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: primaryColor,
                height: 80,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 18,
                      left: 5,
                      right: 10,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          widget.outlets.name,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.outlets.address,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 200,
            child: GoogleMapsWidget(),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: Text(
              "Order Type",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                  fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <LabeledRadio>[
              LabeledRadio(
                label: 'Pickup order',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: 'Pickup order',
                groupValue: _isOrderTypeSelected,
                onChanged: (String newValue) {
                  setState(() {
                    _isOrderTypeSelected = newValue;
                  });
                },
              ),
              LabeledRadio(
                label: 'Drop off to store',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: 'Drop off to store',
                groupValue: _isOrderTypeSelected,
                onChanged: (String newValue) {
                  setState(() {
                    _isOrderTypeSelected = newValue;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: Text(
              "Service",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                  fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <LabeledRadio>[
              LabeledRadio(
                label: 'Wash and Dry Clean (3 Days)',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: 'Wash and Dry Clean (3 Days)',
                groupValue: _isServiceSelected,
                onChanged: (String newValue) {
                  setState(() {
                    _isServiceSelected = newValue;
                  });
                },
              ),
              LabeledRadio(
                label: 'Wash and Dry Clean Express (1 Day)',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: 'Wash and Dry Clean Express (1 Day)',
                groupValue: _isServiceSelected,
                onChanged: (String newValue) {
                  setState(() {
                    _isServiceSelected = newValue;
                  });
                },
              ),
              LabeledRadio(
                label: 'Full Service',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                value: 'Full Service',
                groupValue: _isServiceSelected,
                onChanged: (String newValue) {
                  setState(() {
                    _isServiceSelected = newValue;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: Text(
              "Payment",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                  fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: 150,
                child: LabeledRadio(
                  label: 'Debit / Credit',
                  padding: EdgeInsets.zero,
                  value: 'Debit / Credit',
                  groupValue: _isPaymentSelected,
                  onChanged: (String newValue) {
                    setState(() {
                      _isPaymentSelected = newValue;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 150,
                child: LabeledRadio(
                  label: 'OVO',
                  padding: EdgeInsets.zero,
                  value: 'OVO',
                  groupValue: _isPaymentSelected,
                  onChanged: (String newValue) {
                    setState(() {
                      _isPaymentSelected = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              SizedBox(
                width: 150,
                child: LabeledRadio(
                  label: 'Cash',
                  padding: EdgeInsets.zero,
                  value: 'Cash',
                  groupValue: _isPaymentSelected,
                  onChanged: (String newValue) {
                    setState(() {
                      _isPaymentSelected = newValue;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 150,
                child: LabeledRadio(
                  label: 'Gopay',
                  padding: EdgeInsets.zero,
                  value: 'Gopay',
                  groupValue: _isPaymentSelected,
                  onChanged: (String newValue) {
                    setState(() {
                      _isPaymentSelected = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const OrderConfirmedPage()),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(Color(0xFFFFA928)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
              child: Text(
                "Order now",
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
