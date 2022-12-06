import 'package:flutter/material.dart';
import 'package:laundry_app/colors.dart';
import 'package:laundry_app/entities/outlets.dart';
import 'package:laundry_app/presentation/pages/outlets_details_page.dart';

class OutletsWidget extends StatelessWidget {
  final Outlets outlets;
  const OutletsWidget({super.key, required this.outlets});

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
        height: 180,
        width: MediaQuery.of(context).size.width * 0.4,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('images/${outlets.imageUrl}',
                height: 100, width: 100, fit: BoxFit.fitWidth),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(outlets.name,
                            textAlign: TextAlign.center,
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
                      padding: const EdgeInsets.fromLTRB(5, 10, 2, 0),
                      alignment: Alignment.center,
                      child: const Icon(Icons.location_on,
                          color: primaryColor, size: 18),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 11, 10, 0),
                        child: Text(
                          outlets.address,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
