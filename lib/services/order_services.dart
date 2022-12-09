import 'package:laundry_app/entities/category.dart';
import 'package:laundry_app/entities/order.dart';
import 'package:laundry_app/entities/outlets.dart';

class OrderServices {
  List<Order> getOrders() {
    return [
      Order(
          id: 1,
          outlets: Outlets(
              id: 1,
              name: "Laundry Bersih",
              rating: 4.9,
              description: "Lorem Ipsum Dolor Sit Amet",
              imageUrl: "ads2.png",
              address: "Jl. Surya Sumantri No. 63",
              categories: [
                Category("Washing"),
                Category("Drying"),
                Category("Ironing")
              ]),
          status: false,
          orderTime: "15 September 2022, 10:30",
          rated: 0),
      Order(
          id: 2,
          outlets: Outlets(
              id: 1,
              name: "Laundry Bersih",
              rating: 4.9,
              description: "Lorem Ipsum Dolor Sit Amet",
              imageUrl: "ads2.png",
              address: "Jl. Surya Sumantri No. 63",
              categories: [
                Category("Washing"),
                Category("Drying"),
                Category("Ironing")
              ]),
          status: true,
          orderTime: "25 August 2022, 09:45",
          rated: 5),
      Order(
          id: 3,
          outlets: Outlets(
              id: 1,
              name: "Laundry Bersih",
              rating: 4.9,
              description: "Lorem Ipsum Dolor Sit Amet",
              imageUrl: "ads2.png",
              address: "Jl. Surya Sumantri No. 63",
              categories: [
                Category("Washing"),
                Category("Drying"),
                Category("Ironing")
              ]),
          status: true,
          orderTime: "10 August 2022, 13:24",
          rated: 4)
    ];
  }
}