import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
            IconButton(
              icon: Icon(
                isFavorite == false
                    ? Icons.favorite_border_rounded
                    : Icons.favorite_rounded,
                size: 35,
                color: primaryColor,
                shadows: const <Shadow>[
                  Shadow(color: Colors.black, blurRadius: 1.0)
                ],
              ),
              tooltip: 'Favorite this outlet',
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
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
                            Text(
                              widget.outlets.name,
                              style: const TextStyle(
                                color: primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
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
                            Text(
                              widget.outlets.address,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.outlets.description,
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
                          children: widget.outlets.categories
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
                          final call = Uri.parse('tel:+6289512345678');
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
                          final sms = Uri.parse('sms:+6289512345678?body=hello%20there');
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderPage(outlets:widget.outlets)),
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
