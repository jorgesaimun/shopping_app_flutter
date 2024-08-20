import 'package:flutter/material.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'sizes': selectedSize,
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Product Added Successfully",
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Select Size"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              widget.product['imageUrl'] as String,
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // create price text
                    Text(
                      "Price \$${widget.product['price'] as double}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // create a row for sizes
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            (widget.product['sizes'] as List<int>).length,
                        itemBuilder: (context, index) {
                          final size =
                              (widget.product['sizes'] as List<int>)[index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = size;
                                });
                              },
                              child: Chip(
                                label: Text(
                                  size.toString(),
                                ),
                                backgroundColor: selectedSize == size
                                    ? Theme.of(context).colorScheme.primary
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    //crate a button for add to card

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton.icon(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            minimumSize: const Size(double.infinity, 50)),
                        label: Text(
                          "Add to Cart",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        icon: const Icon(
                          Icons.add_shopping_cart,
                          color: Colors.black,
                        ),
                      ),
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
