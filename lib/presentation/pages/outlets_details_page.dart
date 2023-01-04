import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry_app/bloc/outlets_bloc.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/outlets.dart';
import 'package:laundry_app/presentation/pages/order_page.dart';
import 'package:laundry_app/presentation/widgets/category_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class OutletsDetailsPage extends StatefulWidget {
  final Outlets outlets;
  const OutletsDetailsPage({super.key, required this.outlets});

  @override
  State<OutletsDetailsPage> createState() => _OutletsDetailsPageState();
}

class _OutletsDetailsPageState extends State<OutletsDetailsPage> {
  bool isFavorite = false;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference favorites = firestore.collection('favorites');

  late String? userId = FirebaseAuth.instance.currentUser?.uid;
  late Query query = favorites
      .where('user_id', isEqualTo: userId)
      .where('outlets.id', isEqualTo: widget.outlets.id);
      
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
            StreamBuilder<QuerySnapshot>(
              stream: query.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.size == 0) {
                    return IconButton(
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        size: 35,
                        color: primaryColor,
                        shadows: <Shadow>[
                          Shadow(color: Colors.black, blurRadius: 1.0)
                        ],
                      ),
                      tooltip: 'Favorite this outlet',
                      onPressed: () async {
                        var outlet = jsonEncode(widget.outlets.toJson());
                        await favorites.doc("${widget.outlets.id.toString()}$userId").set({
                          'outlets': jsonDecode(outlet),
                          'user_id': userId
                        });
                      },
                    );
                  } else {
                    return IconButton(
                      icon: const Icon(
          Icons.favorite_rounded,
                        size: 35,
                        color: primaryColor,
                        shadows: <Shadow>[
                          Shadow(color: Colors.black, blurRadius: 1.0)
                        ],
                      ),
                      tooltip: 'Favorite this outlet',
                      onPressed: () async {
                        await favorites.doc("${widget.outlets.id.toString()}$userId").delete();
                      },
                    );
                  }
                } else {
                  return const SizedBox();
                }
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
              const SizedBox(
                height: 10,
              ),
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
      body: Stack(
        children: [
          ListView(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewPadding.top),
              children: [
                Image.asset('images/${widget.outlets.imageUrl}',
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                widget.outlets.name.toString(),
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Wrap(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: const Icon(Icons.star_rate_rounded,
                                      color: accentColor, size: 30),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    widget.outlets.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: primaryColor,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                widget.outlets.address.toString(),
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.outlets.description.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Services",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: primaryColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: widget.outlets.categories!
                              .split(", ")
                              .map((e) => CategoryWidget(category: e))
                              .toList(),
                        )
                      ]),
                )
              ]),
          Positioned(
            bottom: 0,
            left: 20,
            child: Container(
              alignment: Alignment.topCenter,
              height: 100,
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.only(right: 20),
              width: MediaQuery.of(context).size.width - 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final call = Uri.parse('tel:${widget.outlets.phone}');
                          if (await canLaunchUrl(call)) {
                            launchUrl(call);
                          } else {
                            throw 'Could not launch $call';
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: accentColor),
                          ),
                          child: const Icon(
                            Icons.call_rounded,
                            color: accentColor,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final sms = Uri.parse(
                              'sms:${widget.outlets.phone}?body=Saya%20ingin%20order%20laundry');
                          if (await canLaunchUrl(sms)) {
                            launchUrl(sms);
                          } else {
                            throw 'Could not launch $sms';
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: accentColor),
                          ),
                          child: const Icon(
                            Icons.message_rounded,
                            color: accentColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 165,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<OutletsBloc>()
                            .add(OutletsEvent.started(widget.outlets));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OrderPage(outlets: widget.outlets)),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color(0xFFFFA928)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      child: const Text(
                        "Order Now",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
