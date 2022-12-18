import 'package:laundry_app/entities/outlets.dart';

class Order {
  final int id;
  final Outlets outlets;
  final String status;
  final String orderTime;
  final double rated;
  final int weight;
  final String payment;
  final double price;

  Order({required this.id, required this.outlets, required this.status, required this.orderTime, required this.rated, required this.weight, required this.payment, required this.price});
}