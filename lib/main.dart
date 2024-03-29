import 'package:flutter/material.dart';
import 'package:store/views/cart_view.dart';
import 'package:store/views/favourite_view.dart';
import 'package:store/views/home_view.dart';
import 'package:store/views/profile_view.dart';
import 'package:store/views/search_ciew.dart';
import 'package:store/views/store_view.dart';
import 'package:store/views/update_product_view.dart';

void main() {
  runApp(Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      routes: {
        StoreView.id: (context) => StoreView(),
        UpdateProductView.id: (context) => UpdateProductView(),
        CartView.id: (context) => CartView(),
        FavouriteView.id: (context) => FavouriteView(),
        HomeView.id: (context) => HomeView(),
        ProfileView.id: (context) => ProfileView(),
        SearchView.id: (context) => SearchView(),
      },
      initialRoute: StoreView.id,
    );
  }
}
