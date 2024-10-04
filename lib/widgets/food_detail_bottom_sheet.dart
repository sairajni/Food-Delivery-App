import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/blocs/cart/cart_event.dart';
import '../blocs/cart/cart_bloc.dart';
import '../models/food_item.dart';

class FoodDetailBottomSheet extends StatelessWidget {
  final FoodItem foodItem;

  FoodDetailBottomSheet({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(foodItem.name, style: TextStyle(fontSize: 24)),
          Image.network(foodItem.imageUrl),
          Text('\$${foodItem.price}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(AddToCart(foodItem));
              Navigator.pop(context);
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
