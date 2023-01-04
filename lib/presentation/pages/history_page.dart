import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/entities/order.dart' as order2;
import 'package:laundry_app/presentation/widgets/header.dart';
import 'package:laundry_app/presentation/widgets/history_outlets_widget.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference orders = firestore.collection('orders');
    final String? userID = FirebaseAuth.instance.currentUser?.uid;
    final Query query = orders.where('user_id', isEqualTo: userID);

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
                          // context.goNamed('profile');
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
            StreamBuilder<QuerySnapshot>(
              stream: query.snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  return Flexible(
                      child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          children: snapshot.data!.docs.map((e) {
                            order2.Order order = order2.Order.fromJson(
                                e.data() as Map<String, dynamic>);
                            return HistoryOutletsWidget(order: order);
                          }).toList()
                          // children: OrderServices()
                          //     .getOrders()
                          //     .map((e) => HistoryOutletsWidget(order: e))
                          //     .toList(),
                          ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
