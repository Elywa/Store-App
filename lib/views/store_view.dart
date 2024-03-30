import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_products.dart';
import 'package:store/views/add_product_details.dart';
import 'package:store/views/cart_view.dart';
import 'package:store/views/favourite_view.dart';
import 'package:store/views/home_view.dart';
import 'package:store/views/profile_view.dart';
import 'package:store/views/search_ciew.dart';
import 'package:store/widgets/custom_card.dart';

class StoreView extends StatefulWidget {
  StoreView({super.key});
  static String id = 'StoreView';

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  bool isLoading = false;

  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeView(),
    SearchView(),
    CartView(),
    FavouriteView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: CircleAvatar(
      //     backgroundColor: Colors.green,
      //     radius: 32,
      //     child: IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.add,
      //       ),
      //     )),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProductView.id);
              },
              icon: const Icon(
                FontAwesomeIcons.plus,
                color: Colors.black,
              ))
        ],
        backgroundColor: const Color(0xffB7935F),
        centerTitle: true,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xffB7935F),
        ),
        child: BottomNavigationBar(
            selectedItemColor: Colors.black,
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/home_icon.jpg'),
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/search.png'),
                  ),
                  label: 'search'),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/cart.png'),
                  ),
                  label: 'cart'),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/favourite.png'),
                  ),
                  label: 'favourite'),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                    AssetImage('assets/profile.jpg'),
                  ),
                  label: 'Profile'),
            ]),
      ),
      body: tabs[selectedIndex],
    );
  }
}
