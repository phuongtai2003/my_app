import 'package:flutter/material.dart';
import 'package:my_app/common/seller_bottom_bar.dart';
import 'package:my_app/common/user_bottom_bar.dart';
import 'package:my_app/features/auth/screens/auth_screen.dart';
import 'package:my_app/features/cart/screens/cart_screen.dart';
import 'package:my_app/features/checkout/screens/checkout_screen.dart';
import 'package:my_app/features/home/screens/category_screen.dart';
import 'package:my_app/features/home/screens/home_screen.dart';
import 'package:my_app/features/product_details/screens/product_detail_screen.dart';
import 'package:my_app/features/profile/screens/profile_screen.dart';
import 'package:my_app/features/search/screens/search_screen.dart';
import 'package:my_app/features/seller/screens/add_product_screen.dart';
import 'package:my_app/features/seller/screens/delete_product_screen.dart';
import 'package:my_app/features/seller/screens/seller_screen.dart';
import 'package:my_app/models/product.dart';

Route<dynamic> onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case CheckoutScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const CheckoutScreen(),
        settings: settings,
      );
    case CartScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const CartScreen(),
        settings: settings,
      );
    case ProductDetailScreen.routeName:
      final product = settings.arguments as Product;
      return MaterialPageRoute(
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
        settings: settings,
      );
    case DeleteProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const DeleteProductScreen(),
        settings: settings,
      );
    case SearchScreen.routeName:
      final name = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => SearchScreen(
          name: name,
        ),
        settings: settings,
      );
    case CategoryScreen.routeName:
      final query = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryScreen(
          query: query,
        ),
        settings: settings,
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductScreen(),
        settings: settings,
      );
    case SellerScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SellerScreen(),
        settings: settings,
      );
    case SellerBottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const SellerBottomBar(),
        settings: settings,
      );
    case ProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
        settings: settings,
      );
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: settings,
      );
    case UserBottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const UserBottomBar(),
        settings: settings,
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Page does not exist"),
          ),
        ),
        settings: settings,
      );
  }
}
