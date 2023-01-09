import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/custom_button.dart';
import 'package:my_app/common/custom_textfield.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/features/seller/services/seller_services.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static const String routeName = '/add_product';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final SellerServices sellerServices = SellerServices();

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _weightController = TextEditingController();
  final _quantityController = TextEditingController();
  final _descriptionController = TextEditingController();
  List<File>? images;

  String currentCategory = "Book";

  List<String> category = [
    "Book",
    "Laptop",
    "Accessories",
    "Sport",
    "Fashion",
  ];

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _weightController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
  }

  void sell() {
    if (_formState.currentState!.validate() && images != null) {
      sellerServices.sellProduct(
        context: context,
        name: _nameController.text,
        price: double.parse(_priceController.text),
        weight: double.parse(_weightController.text),
        quantity: int.parse(_quantityController.text),
        description: _descriptionController.text,
        category: currentCategory,
        images: images!,
      );
    }
  }

  void addImages() async {
    images = await pickImages();
    setState(() {});
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
          centerTitle: true,
          title: const Text(
            "Add new product",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formState,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: Column(
              children: [
                images == null
                    ? GestureDetector(
                        onTap: addImages,
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            color: GlobalVariables.selectImageBoxColor,
                            border: Border.all(
                              style: BorderStyle.solid,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_a_photo_outlined,
                                size: 50,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Add product images",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: CarouselSlider(
                          items: images!
                              .map(
                                (e) => Image.file(
                                  e,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 200,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textEditingController: _nameController,
                  hintText: "Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textEditingController: _priceController,
                  hintText: "Price",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textEditingController: _weightController,
                  hintText: "Weight",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textEditingController: _quantityController,
                  hintText: "Quantity",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  textEditingController: _descriptionController,
                  hintText: "Description",
                  maxLines: 8,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    elevation: 0,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    items: category
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        currentCategory = value!;
                      });
                    },
                    value: currentCategory,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  buttonText: "Sell Product",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
