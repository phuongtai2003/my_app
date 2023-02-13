// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_app/models/product.dart';

class Order {
  final String? id;
  final String? userId;
  final List<Product> products;
  final List<int> quantity;
  final String address;
  final double totalPrice;
  final int orderedAt;
  final String paymentMethod;
  final int orderStatus;

  Order({
    this.id,
    this.userId,
    required this.products,
    required this.quantity,
    required this.address,
    required this.totalPrice,
    required this.orderedAt,
    required this.paymentMethod,
    required this.orderStatus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'products': products.map((x) => x.toMap()).toList(),
      'quantity': quantity,
      'address': address,
      'totalPrice': totalPrice,
      'orderedAt': orderedAt,
      'paymentMethod': paymentMethod,
      'orderStatus': orderStatus,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] != null ? map['_id'] as String : null,
      userId: map['userId'] != null ? map['userId'] as String : null,
      products: List<Product>.from(
        map['products'].map(
          (x) => Product.fromMap(x['product']),
        ),
      ),
      quantity: List<int>.from(
        (map['products'].map(
          (x) => x['quantity'],
        )),
      ),
      address: map['address'] as String,
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
      orderedAt: map['orderedAt']?.toInt() ?? 0,
      paymentMethod: map['paymentMethod'] as String,
      orderStatus: map['orderStatus']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);
}
