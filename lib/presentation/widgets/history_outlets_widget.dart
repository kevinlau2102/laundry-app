import 'package:flutter/material.dart';

import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/order.dart';
import 'package:laundry_app/presentation/pages/completed_order_page.dart';
import 'package:laundry_app/presentation/pages/ongoing_order_page.dart';

class HistoryOutletsWidget extends StatelessWidget {
  final Order order;
  const HistoryOutletsWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => order.status == "Done"
                  ? CompletedOrderPage(
                      order: order,
                    )
                  : OngoingOrderPage(order: order)),
        );
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 10),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: <Widget>[
            Image.asset('images/${order.outlets!.imageUrl}',
                height: 100, width: 100, fit: BoxFit.fitHeight),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(order.outlets!.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: primaryColor, fontSize: 12)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              order.status == "Done" ? "Completed" : "On-going",
                              style: TextStyle(
                                fontSize: 12,
                                color: order.status == "Done"
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    order.status == "Done"
                        ? Container(
                            height: 15,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            alignment: Alignment.topRight,
                            child: Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Text(
                                    "Rated: ${order.rated!.toStringAsFixed(0)}",
                                    style: const TextStyle(fontSize: 10),
                                  ),
                                ),
                                const Icon(
                                  Icons.star_rate_rounded,
                                  color: accentColor,
                                  size: 15,
                                )
                              ],
                            ))
                        : const SizedBox(
                            height: 15,
                          ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(8, 0, 2, 0),
                          alignment: Alignment.center,
                          child: const Icon(Icons.location_on,
                              color: primaryColor, size: 18),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Text(
                              order.outlets!.address,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        (order.orderTime.toString()),
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 10),
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
