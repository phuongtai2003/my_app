import 'package:flutter/material.dart';
import 'package:my_app/common/single_product.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/seller/screens/add_product_screen.dart';
import 'package:my_app/features/seller/services/seller_services.dart';
import 'package:my_app/models/product.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen({super.key});
  static const String routeName = "/seller_screen";

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  final SellerServices sellerServices = SellerServices();
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    products = await sellerServices.getAllProduct(context: context);
    setState(() {});
  }

  void navigateToAddScreen() {
    Navigator.pushNamed(
      context,
      AddProductScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
                margin: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                child: Image.asset(
                  "assets/images/app_bar.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 5,
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
      body: products.isEmpty
          ? const Center(
              child: Text("There is no products to show"),
            )
          : GridView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 5,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return SingleProduct(
                  product: products[index],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddScreen,
        tooltip: "Add a product",
        backgroundColor: GlobalVariables.secondaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
