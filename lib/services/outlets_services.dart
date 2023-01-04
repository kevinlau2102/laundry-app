import 'package:laundry_app/entities/outlets.dart';

class OutletsServices {
  List<Outlets> getOutlets() {
    return [
      Outlets(
          id: 1,
          name: "Laundry Bersih",
          rating: 4.9,
          description: "Lorem Ipsum Dolor Sit Amet",
          imageUrl: "ads2.png",
          address: "Jl. Surya Sumantri No. 63",
          categories:"Washing, Drying, Ironing"),
      Outlets(
          id: 2,
          name: "Laundry Bersih 2",
          rating: 4.8,
          description: "Lorem Ipsum Dolor Sit Amet",
          imageUrl: "ads2.png",
          address: "Jl. Surya Sumantri No. 63A",
          categories: "Washing, Drying"),
      Outlets(
          id: 3,
          name: "Laundry Bersih 3",
          rating: 4.7,
          description: "Lorem Ipsum Dolor Sit Amet",
          imageUrl: "ads2.png",
          address: "Jl. Surya Sumantri No. 63A",
          categories: "Washing, Drying"),
      Outlets(
          id: 4,
          name: "Laundry Bersih 4",
          rating: 4.6,
          description: "Lorem Ipsum Dolor Sit Amet",
          imageUrl: "ads2.png",
          address: "Jl. Surya Sumantri No. 63A",
          categories:"Washing, Drying, Ironing"),
    ];
  }
}
