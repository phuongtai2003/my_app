import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_app/common/custom_button.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/features/product_details/services/product_detail_services.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  static const String routeName = '/product-detail-screen';
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final productDetailServices = ProductDetailServices();
  int cartQuantity = 1;
  double avgRating = 0;
  double myRating = 0;
  bool isFavorite = false;

  void addProduct() {
    if (cartQuantity < widget.product.quantity) {
      setState(() {
        cartQuantity++;
      });
    } else {
      showSnackBar(
        context,
        "Product quantity exceeded",
      );
    }
  }

  void decreaseProduct() {
    if (cartQuantity > 1) {
      setState(() {
        cartQuantity--;
      });
    } else {
      showSnackBar(
        context,
        "Quantity can not be smaller than 1",
      );
    }
  }

  @override
  void initState() {
    super.initState();
    double totalRating = 0;
    for (int i = 0; i < widget.product.ratings!.length; i++) {
      totalRating = totalRating + widget.product.ratings![i].rating;
      if (widget.product.ratings![i].userId ==
          Provider.of<UserProvider>(context, listen: false).user.id) {
        myRating = widget.product.ratings![i].rating;
      }
    }
    if (totalRating != 0) {
      avgRating = totalRating / widget.product.ratings!.length;
    }
    final user = Provider.of<UserProvider>(
      context,
      listen: false,
    ).user;
    for (int i = 0; i < user.favoriteProducts!.length; i++) {
      if (user.favoriteProducts![i].id! == widget.product.id!) {
        setState(() {
          isFavorite = true;
        });
        break;
      }
    }
    setState(() {});
  }

  void likeProduct() {
    productDetailServices.favoriteProduct(
      context: context,
      product: widget.product,
    );
    isFavorite = !isFavorite;
    setState(() {});
  }

  void rateProduct(double value) {
    productDetailServices.rateProduct(
      context: context,
      product: widget.product,
      rating: value,
    );
  }

  void addToCart() {
    productDetailServices.addToCart(
      context: context,
      product: widget.product,
      quantity: cartQuantity,
    );
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
                  top: 5,
                ),
                child: const Text(
                  "Product Details",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 5,
                  top: 5,
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: CarouselSlider(
                items: widget.product.images
                    .map(
                      (e) => Image.network(
                        e,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 300,
                  autoPlay: true,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
                border: Border.all(color: Colors.black, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: likeProduct,
                          child: isFavorite == true
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.pink,
                                ),
                        ),
                      ],
                    ),
                    Text(
                      "\$${widget.product.price}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.product.description,
                      style: const TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Category",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.product.category,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Weight",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${widget.product.weight} gram",
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.product.quantity.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Rating",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RatingBar.builder(
                            initialRating: avgRating,
                            minRating: 0,
                            itemCount: 5,
                            allowHalfRating: true,
                            itemPadding: const EdgeInsets.only(
                              right: 5,
                            ),
                            itemBuilder: (context, index) => const Icon(
                              Icons.favorite,
                              color: GlobalVariables.secondaryColor,
                            ),
                            onRatingUpdate: rateProduct,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: decreaseProduct,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    ),
                                    color: Colors.white,
                                  ),
                                  width: 55,
                                  height: 50,
                                  child: const Icon(
                                    Icons.remove,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 55,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.black12,
                                  border: Border.symmetric(
                                    vertical: BorderSide(),
                                  ),
                                ),
                                child: Text(
                                  cartQuantity.toString(),
                                ),
                              ),
                              InkWell(
                                onTap: addProduct,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      15,
                                    ),
                                  ),
                                  width: 55,
                                  height: 50,
                                  child: const Icon(
                                    Icons.add,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomButton(
                            buttonText: "Add to cart",
                            onTap: addToCart,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
