import 'package:laundry_app/entities/outlets.dart';

class Order {
  final int id;
  final Outlets outlets;
  final bool status;
  final String orderTime;
  final double rated;

  Order({required this.id, required this.outlets, required this.status, required this.orderTime, required this.rated});
}