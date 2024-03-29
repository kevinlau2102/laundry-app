import 'package:flutter/material.dart';

import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/outlets.dart';
import 'package:laundry_app/presentation/pages/outlets_details_page.dart';

class HorizontalOutletsWidget extends StatelessWidget {
  final Outlets outlets;
  const HorizontalOutletsWidget({super.key, required this.outlets});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OutletsDetailsPage(outlets: outlets,)),
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
            Image.asset('images/${outlets.imageUrl}',
                height: 100, width: 100, fit: BoxFit.fitHeight),
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 170,
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(outlets.name.toString(),
                            overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: primaryColor, fontSize: 12)),
                          ),
                          Wrap(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 8),
                                alignment: Alignment.center,
                                child: const Icon(Icons.star_rate_rounded,
                                    color: accentColor, size: 18),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  outlets.rating.toString(),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(8, 10, 2, 0),
                          alignment: Alignment.center,
                          child: const Icon(Icons.location_on,
                              color: primaryColor, size: 18),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 11, 10, 0),
                            child: Text(
                              outlets.address.toString(),
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text((outlets.categories!).split(", ")
                          .map((e) => e)
                          .toList()
                          .join(", "), style: const TextStyle(color: Colors.black87, fontSize: 10),),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
