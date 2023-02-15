import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/home/services/home_services.dart';
import 'package:my_app/features/product_details/screens/product_detail_screen.dart';
import 'package:my_app/models/product.dart';

class TopDeal extends StatefulWidget {
  const TopDeal({super.key});

  @override
  State<TopDeal> createState() => _TopDealState();
}

class _TopDealState extends State<TopDeal> {
  final HomeServices _homeServices = HomeServices();

  void navigateToDetailScreen(Product product) {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  List<Product> deals = [];
  void getDeals() async {
    deals = await _homeServices.getDealsList(
      context: context,
    );
    setState(() {});
  }

  @override
  void initState() {
    getDeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return deals.isEmpty
        ? const Center(
            child: Text(
              "There are no products to show",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Deal of the day",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Show all",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(
                    deals[0].images[0],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "\$${deals[0].price}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Text(
                    deals[0].name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(
                    8,
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final image = deals[index].images[0];
                      return GestureDetector(
                        onTap: () => navigateToDetailScreen(
                          deals[index],
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                            right: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: GlobalVariables.secondaryColor,
                            ),
                          ),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                        ),
                      );
                    },
                    itemCount: deals.length,
                  ),
                ),
              ],
            ),
          );
  }
}
