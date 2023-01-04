import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/bloc/outlets_bloc.dart';
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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orders = firestore.collection('orders');
  String _isOrderTypeSelected = "Pickup order";
  String _isServiceSelected = "Wash and Dry Clean (3 Days)";
  String _isPaymentSelected = "Debit / Credit";

  @override
  Widget build(BuildContext context) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));

    String orderID = getRandomString(10);
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
                        width: MediaQuery.of(context).size.width - 100,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(top: 15),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            widget.outlets.name.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.outlets.address.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 200,
            child: GoogleMapsWidget(
              latitude: widget.outlets.latitude!,
              longitude: widget.outlets.longitude!,
            ),
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
            children: [
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
              widget.outlets.categories!.split(", ").length > 2
                  ? LabeledRadio(
                      label: 'Full Service',
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      value: 'Full Service',
                      groupValue: _isServiceSelected,
                      onChanged: (String newValue) {
                        setState(() {
                          _isServiceSelected = newValue;
                        });
                      },
                    )
                  : const SizedBox(),
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
          BlocBuilder<OutletsBloc, OutletsState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    showProgress(context);
                    var json = jsonEncode(state.when(
                        initial: () => "",
                        running: (outlets) => outlets.toJson()));

                    await orders.doc(orderID).set({
                      'id': orderID,
                      'order_time': DateTime.now(),
                      'order_type': _isOrderTypeSelected,
                      'outlets': jsonDecode(json),
                      'payment': _isPaymentSelected,
                      'price': 18000,
                      'rated': 0,
                      'service': _isServiceSelected,
                      'status': "Washing",
                      'user_id': FirebaseAuth.instance.currentUser?.uid,
                      'weight': 2
                    }).then((value) {
                      Navigator.of(context).pop();
                      Timer(
                          const Duration(milliseconds: 300),
                          () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OrderConfirmedPage()),
                              ));
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                          Color(0xFFFFA928)),
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
              );
            },
          ),
        ],
      )),
    );
  }

  void showProgress(BuildContext context) {
    AwesomeDialog(
        dialogBackgroundColor: Colors.transparent,
        width: MediaQuery.of(context).size.width,
        context: context,
        dialogType: DialogType.noHeader,
        animType: AnimType.bottomSlide,
        body: const SizedBox(
          height: 120,
          child: Center(child: CircularProgressIndicator()),
        )).show();
  }
}
