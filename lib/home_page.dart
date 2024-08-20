import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/cart_page.dart';

import 'package:shopping_app_flutter/product_list.dart';
//import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currPage = 0;

  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currPage,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              //color: Colors.black,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_checkout,
              // color: Colors.black,
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
