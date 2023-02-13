import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/order_details/widgets/order_product.dart';
import 'package:my_app/models/order.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });
  static const String routeName = '/order-details-screen';
  final Order order;

  @override
  Widget build(BuildContext context) {
    int totalProduct = 0;
    order.quantity.map((e) => totalProduct += e).toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(
                right: 15,
              ),
              child: Image.asset(
                "assets/images/app_bar.png",
                height: 50,
                width: 50,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order Information",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Number of products: ${order.products.length}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Total amount of products: $totalProduct",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Total Billing: \$${order.totalPrice}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Deliverance address: ${order.address}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Payment method: ${order.paymentMethod}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Items includes:",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: GlobalVariables.secondaryColor,
                  ),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return OrderProduct(
                      product: order.products[index],
                      quantity: order.quantity[index],
                    );
                  },
                  itemCount: order.products.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
