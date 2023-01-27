import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/cart/services/cart_services.dart';
import 'package:my_app/features/product_details/services/product_detail_services.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  const CartProduct({super.key, required this.index});
  final int index;

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final ProductDetailServices productDetailServices = ProductDetailServices();
  final CartServices cartServices = CartServices();

  void removeFromCart(Product product) {
    cartServices.removeFromCart(context: context, product: product);
  }

  void addToCart(Product product) {
    productDetailServices.addToCart(
        context: context, product: product, quantity: 1);
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<UserProvider>(context).user.cart[widget.index];
    final Product product = Product.fromMap(cart['product']);
    final int quantity = cart['quantity'];
    double avgRating = 0;
    for (int i = 0; i < product.ratings!.length; i++) {
      avgRating = avgRating + product.ratings![i].rating;
    }
    if (avgRating != 0) {
      avgRating = avgRating / product.ratings!.length;
    }
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.2,
          color: GlobalVariables.secondaryColor,
        ),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      padding: const EdgeInsets.all(
        5,
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
          Container(
            padding: const EdgeInsets.all(
              10,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.category,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: GlobalVariables.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: GlobalVariables.secondaryColor,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          padding: const EdgeInsets.all(
                            5,
                          ),
                          child: Row(children: [
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              avgRating.toString(),
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 10,
              top: 5,
              bottom: 5,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () => removeFromCart(product),
                  child: const SizedBox(
                    width: 35,
                    height: 35,
                    child: Icon(
                      Icons.remove,
                      size: 25,
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: GlobalVariables.secondaryColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Text(
                    quantity.toString(),
                  ),
                ),
                InkWell(
                  onTap: () => addToCart(product),
                  child: const SizedBox(
                    width: 35,
                    height: 35,
                    child: Icon(
                      Icons.add,
                      size: 25,
                    ),
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
