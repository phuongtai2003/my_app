// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final String? id;
  final String name;
  final double price;
  final double weight;
  final int quantity;
  final String description;
  final String category;
  final List<String> images;

  Product({
    this.id,
    required this.name,
    required this.price,
    required this.weight,
    required this.quantity,
    required this.description,
    required this.category,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'weight': weight,
      'quantity': quantity,
      'description': description,
      'category': category,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'] != null ? map['_id'] as String : null,
      name: map['name'] as String,
      price: map['price']?.toDouble() ?? 0,
      weight: map['weight']?.toDouble() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
      description: map['description'] as String,
      category: map['category'] as String,
      images: List<String>.from((map['images'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
