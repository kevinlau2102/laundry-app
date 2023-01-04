import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_app/entities/outlets.dart';

class Order {
  final int? id;
  final Outlets? outlets;
  final String? status;
  final Timestamp? orderTime;
  final double? rated;
  final int? weight;
  final String? payment;
  final double? price;

  Order({this.id,  this.outlets,  this.status,  this.orderTime,  this.rated,  this.weight,  this.payment,  this.price});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    outlets: json['outlets'],
    status: json['status'],
    orderTime: json['order_time'],
    rated: json['rated'],
    weight: json['weight'],
    payment: json['payment'],
    price: json['price']

  );
}