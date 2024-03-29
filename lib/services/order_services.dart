import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_app/entities/order.dart' as Orders;
import 'package:laundry_app/entities/outlets.dart';

class OrderServices {
  List<Orders.Order> getOrders() {
    return [
      Orders.Order(
          id: "20gegjo34s",
          outlets: Outlets(
              id: 1,
              name: "Laundry Bersih",
              // rating: 4.9,
              description: "Lorem Ipsum Dolor Sit Amet",
              imageUrl: "ads2.png",
              address: "Jl. Surya Sumantri No. 63",
              categories:"Washing, Drying, Ironing"),
          status: "Washing",
          orderTime: Timestamp.fromMillisecondsSinceEpoch(1663246800000),
          rated: 0, weight: 3,
          payment: "OVO",
          price: 27000),
      // Order(
      //     id: 2,
      //     outlets: Outlets(
      //         id: 1,
      //         name: "Laundry Bersih",
      //         rating: 4.9,
      //         description: "Lorem Ipsum Dolor Sit Amet",
      //         imageUrl: "ads2.png",
      //         address: "Jl. Surya Sumantri No. 63",
      //         categories: [
      //           Category("Washing"),
      //           Category("Drying"),
      //           Category("Ironing")
      //         ]),
      //     status: "Done",
      //     orderTime: "25 August 2022, 09:45",
      //     rated: 5, weight: 2,
      //     payment: "Gopay",
      //     price: 18000),
      // Order(
      //     id: 3,
      //     outlets: Outlets(
      //         id: 1,
      //         name: "Laundry Bersih",
      //         rating: 4.9,
      //         description: "Lorem Ipsum Dolor Sit Amet",
      //         imageUrl: "ads2.png",
      //         address: "Jl. Surya Sumantri No. 63",
      //         categories: [
      //           Category("Washing"),
      //           Category("Drying"),
      //           Category("Ironing")
      //         ]),
      //     status: "Done",
      //     orderTime: "10 August 2022, 13:24",
      //     rated: 4, weight: 1,
      //     payment: "OVO",
      //     price: 9000)
    ];
  }
}
