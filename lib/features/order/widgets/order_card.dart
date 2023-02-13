import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/models/order.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: GlobalVariables.secondaryColor,
        ),
      ),
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            order.products[0].images[0],
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${order.id}",
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Total price: \$${order.totalPrice}",
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Ordered At: ${DateFormat("dd/MM/yy hh:mm a").format(DateTime.fromMillisecondsSinceEpoch(order.orderedAt))}",
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Payment by: ${order.paymentMethod}",
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Status: ${order.orderStatus}/5",
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
