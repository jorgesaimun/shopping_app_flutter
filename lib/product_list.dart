import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/global_variable.dart';
import 'package:shopping_app_flutter/product_card.dart';
import 'package:shopping_app_flutter/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    "Bata",
    "Addidas",
    "Apex",
    "Nike",
  ];

  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  final border = const OutlineInputBorder(
    borderSide: BorderSide(
        //color: Colors.white,
        ),
    borderRadius: BorderRadius.horizontal(
      left: Radius.circular(30),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Shoes\nCollections",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  // width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      // hintText: "Search",
                      labelText: "Search shoes",
                      labelStyle: const TextStyle(
                        color: Colors.blue,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      // border:
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //Chip
                    child: GestureDetector(
                      onTap: () {
                        selectedFilter = filter;
                        setState(() {});
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                        label: Text(
                          filter,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                            bottom: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
