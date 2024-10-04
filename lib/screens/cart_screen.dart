import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../blocs/cart/cart_state.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final cartItems = (state is CartUpdated) ? state.items : [];

          // Calculate total amount
          double totalAmount = cartItems.fold(0, (total, cartItem) {
            return total + (cartItem.foodItem.price * cartItem.quantity);
          });

          return cartItems.isEmpty
              ? Center(child: Text('No items in the cart.'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartItems[index];
                          return ListTile(
                            title: Text(cartItem.foodItem.name),
                            subtitle: Text(
                                '\$${cartItem.foodItem.price} x ${cartItem.quantity}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    BlocProvider.of<CartBloc>(context)
                                        .add(RemoveFromCart(cartItem.foodItem));
                                  },
                                ),
                                Text(cartItem.quantity.toString()),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    BlocProvider.of<CartBloc>(context)
                                        .add(AddToCart(cartItem.foodItem));
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('\$${totalAmount.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle checkout action
                        print('Proceeding to checkout');
                      },
                      child: Text('Checkout'),
                    ),
                    SizedBox(height: 16),
                  ],
                );
        },
      ),
    );
  }
}
