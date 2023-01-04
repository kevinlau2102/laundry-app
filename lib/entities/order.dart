import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:laundry_app/entities/outlets.dart';

class Order {
  final String? id;
  final Outlets? outlets;
  final String? status;
  final Timestamp? orderTime;
  final String? orderType;
  final String? service;
  final int? rated;
  final int? weight;
  final String? payment;
  final int? price;
  final String? userId;

  Order({this.id,  this.outlets,  this.status,  this.orderTime, this.orderType, this.service, this.rated,  this.weight,  this.payment,  this.price, this.userId});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    outlets: Outlets.fromJson(json['outlets'] as Map<String, dynamic>),
    status: json['status'],
    orderTime: json['order_time'],
    orderType: json['order_type'],
    service: json['service'],
    rated: json['rated'],
    weight: json['weight'],
    payment: json['payment'],
    price: json['price'],
    userId: json['user_id']
  );
}