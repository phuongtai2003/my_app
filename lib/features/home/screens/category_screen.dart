import "package:flutter/material.dart";
import 'package:my_app/common/single_product.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/home/services/home_services.dart';
import 'package:my_app/features/product_details/screens/product_detail_screen.dart';
import 'package:my_app/models/product.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.query});
  static const String routeName = "/category-screen";
  final String query;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Product> products = [];
  final HomeServices homeServices = HomeServices();
  void fetchProductsByCategory(String category) async {
    products = await homeServices.getProductsByCategory(
        context: context, category: category);
    setState(() {});
  }

  @override
  void initState() {
    fetchProductsByCategory(
      widget.query,
    );
    super.initState();
  }

  void navigateToDetailScreen(Product product) {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
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
                margin: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: Image.asset(
                  "assets/images/app_bar.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5,
        ),
        child: Column(
          children: [
            Text(
              "${products.length} products fit the search criteria",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 5,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => navigateToDetailScreen(products[index]),
                  child: SingleProduct(
                    product: products[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
