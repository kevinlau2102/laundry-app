import 'package:laundry_app/entities/category.dart';
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
          categories: [Category("Washing"), Category("Drying"), Category("Ironing")]),
      Outlets(
          id: 2,
          name: "Laundry Bersih",
          rating: 4.9,
          description: "Lorem Ipsum Dolor Sit Amet",
          imageUrl: "ads2.png",
          address: "Jl. Surya Sumantri No. 63A",
          categories: [Category("Washing"), Category("Drying"), Category("Ironing")]),
      Outlets(
          id: 3,
          name: "Laundry Bersih",
          rating: 4.9,
          description: "Lorem Ipsum Dolor Sit Amet",
          imageUrl: "ads2.png",
          address: "Jl. Surya Sumantri No. 63A",
          categories: [Category("Washing"), Category("Drying"), Category("Ironing")]),
      Outlets(
          id: 4,
          name: "Laundry Bersih",
          rating: 4.9,
          description: "Lorem Ipsum Dolor Sit Amet",
          imageUrl: "ads2.png",
          address: "Jl. Surya Sumantri No. 63A",
          categories: [Category("Washing"), Category("Drying"), Category("Ironing")]),
    ];
  }
}
