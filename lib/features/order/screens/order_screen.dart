import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/order/services/order_services.dart';
import 'package:my_app/features/order/widgets/order_card.dart';
import 'package:my_app/features/order_details/screens/order_details_screen.dart';
import 'package:my_app/models/order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});
  static const String routeName = '/order-screen';
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Order> orderList = [];
  final OrderServices _orderServices = OrderServices();
  void fetchAllOrder() async {
    orderList = await _orderServices.getAllOrder(context: context);
    setState(() {});
  }

  void navigateToOrderDetails(Order order) {
    Navigator.pushNamed(
      context,
      OrderDetailsScreen.routeName,
      arguments: order,
    );
  }

  @override
  void initState() {
    super.initState();
    fetchAllOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Image.asset(
                  "assets/images/app_bar.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: const Icon(
                  Icons.search,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: const Text(
                "Your Order",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            orderList.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text(
                        "There is no orders to show",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: OrderCard(
                            order: orderList[index],
                          ),
                          onTap: () => navigateToOrderDetails(
                            orderList[index],
                          ),
                        );
                      },
                      itemCount: orderList.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
