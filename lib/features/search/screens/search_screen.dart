import 'package:flutter/material.dart';
import 'package:my_app/common/single_product.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/search/services/search_services.dart';
import 'package:my_app/models/product.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.name,
  });
  static const String routeName = '/search-screen';
  final String name;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchServices _searchServices = SearchServices();
  List<Product> products = [];

  void fetchProducts() async {
    products = await _searchServices.getProductsByName(
        context: context, name: widget.name);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
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
                margin: const EdgeInsets.only(
                  left: 5,
                  top: 5,
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
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          10,
        ),
        child: Column(
          children: [
            Text(
              "${products.length} products fit the search criteria",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => SingleProduct(
                  product: products[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
