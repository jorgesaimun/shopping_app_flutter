import 'package:flutter/material.dart';
import 'package:shopping_app_flutter/cart_provider.dart';
import 'package:shopping_app_flutter/global_variable.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // print("hello");
    print(Provider.of<CartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['size'].toString()}'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
