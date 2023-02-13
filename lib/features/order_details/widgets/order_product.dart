import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/models/product.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct({
    super.key,
    required this.product,
    required this.quantity,
  });
  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: GlobalVariables.secondaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.images[0],
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Qty: $quantity",
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Price: \$${product.price}",
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Category: \$${product.category}",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
