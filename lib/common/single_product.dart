import 'package:flutter/material.dart';
import 'package:my_app/models/product.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: Colors.black,
          width: 0.75,
        ),
        color: Colors.black12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(
              top: 5,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
            ),
            child: Image.network(
              product.images[0],
              fit: BoxFit.cover,
              height: 120,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            "\$${product.price}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "QTY: ${product.quantity}",
          ),
          Text(
            product.category,
          ),
        ],
      ),
    );
  }
}
