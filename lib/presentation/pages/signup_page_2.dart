import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage2 extends StatefulWidget {
  final String? uid;
  const SignUpPage2({super.key, this.uid});

  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  String? selectedProvinsi;
  List<String> provinsi = [
    "Select Province",
    "Aceh",
    "Bali",
    "Banten",
    "Bengkulu",
    "DKI Yogyakarta",
    "DKI Jakarta",
    "Gorontalo",
    "Jambi",
    "Jawa Barat",
    "Jawa Tengah",
    "Jawa Timur",
    "Kalimantan Barat",
    "Kalimantan Selatan",
    "Kalimantan Tengah",
    "Kalimantan Timur",
    "Kalimantan Utara",
    "Kepulauan Bangka Belitung",
    "Kepulauan Riau",
    "Lampung",
    "Maluku",
    "Maluku Utara",
    "Nusa Tenggara Barat",
    "Nusa Tenggara Timur",
    "Papua",
    "Papua Barat",
    "Riau",
    "Sulawesi Barat",
    "Sulawesi Selatan",
    "Sulawesi Tengah",
    "Sulawesi Tenggara",
    "Sulawesi Utara",
    "Sumatera Barat",
    "Sumatera Selatan",
    "Sumatera Utara"
  ];
  TextEditingController addressController = TextEditingController(text: "");
  TextEditingController cityController = TextEditingController(text: "");
  TextEditingController postalController = TextEditingController(text: "");
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCol = firestore.collection('user');
  late final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // context.goNamed('signup');
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ))),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/LogoDraft1_1.png',
                      fit: BoxFit.fill,
                      width: 205,
                    )),
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Text(
                    "Add your location:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF52B2CF),
                        fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: addressController,
                    maxLines: 4,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'Address',
                        hintText: 'Address'),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: 'City',
                          hintText: 'City'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 50,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Text("Select Province"),
                        items: provinsi
                            .map(
                              (item) => DropdownMenuItem<String>(
                                enabled: item != "Select Province",
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: item == "Select Province"
                                          ? Colors.black26
                                          : Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                        value: selectedProvinsi,
                        onChanged: (value) {
                          setState(() {
                            selectedProvinsi = value as String;
                          });
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                        ),
                        iconSize: 25,
                        iconEnabledColor: Colors.black45,
                        iconDisabledColor: Colors.grey,
                        buttonPadding: const EdgeInsets.only(right: 10),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                        ),
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 12),
                        dropdownMaxHeight: 200,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: postalController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          labelText: 'Postal Code',
                          hintText: 'Postal Code'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 165,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).popUntil((route) => route.isFirst);
                      // context.goNamed('home');
                      userCol.doc(widget.uid).update({
                        "address": (addressController.text.trim()),
                        "city": (cityController.text.trim()),
                        "postal": (postalController.text.trim()),
                        "province": (selectedProvinsi.toString().trim()),
                      }).then((value) => context.goNamed('login'));
                    },
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Color(0xFFFFA928)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 30,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        // Navigator.of(context)
                        //     .popUntil((route) => route.isFirst);
                        context.goNamed('login');
                      },
                      child: const Text("Skip for now",
                          style: TextStyle(
                              color: Color(0xFFFFA928), fontSize: 16))),
                )
              ]),
            ],
          )
        ],
      ),
    );
  }
}
