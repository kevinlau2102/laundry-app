import 'package:laundry_app/entities/category.dart';

class Outlets {
  final int id;
  final String name;
  final String imageUrl;
  final double rating;
  final String address;
  final String description;
  final List<Category> categories;

  Outlets({required this.id,
  required this.name, required this.imageUrl, required this.rating, required this.address, required this.description, required this.categories });
  
}