import 'package:flutter/material.dart';
import 'package:my_app/common/single_product.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/features/seller/services/seller_services.dart';
import 'package:my_app/models/product.dart';

class DeleteProductScreen extends StatefulWidget {
  const DeleteProductScreen({super.key});
  static const String routeName = '/delete-screen';

  @override
  State<DeleteProductScreen> createState() => _DeleteProductScreenState();
}

class _DeleteProductScreenState extends State<DeleteProductScreen> {
  final SellerServices sellerServices = SellerServices();
  List<Product> products = [];

  void fetchAllProducts() async {
    products = await sellerServices.getAllProduct(context: context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) async {
    sellerServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products.removeAt(index);
        setState(() {});
        showSnackBar(context, "${product.name} has been removed successfully");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
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
                horizontal: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 15,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  showDialogBox(
                    context: context,
                    title: "Delete Product",
                    bodyContent:
                        "Are you sure you want to delete ${products[index].name}.",
                    onYesChoice: () {
                      deleteProduct(
                        products[index],
                        index,
                      );
                      Navigator.pop(context);
                    },
                  );
                },
                child: SingleProduct(
                  product: products[index],
                ),
              ),
            ),
    );
  }
}
