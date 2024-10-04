import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/food_item.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';

class FoodItemWidget extends StatelessWidget {
  final FoodItem foodItem;

  FoodItemWidget({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(foodItem.imageUrl),
        title: Text(foodItem.name),
        subtitle: Text('\$${foodItem.price}'),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            print('Add button pressed for: ${foodItem.name}');
            BlocProvider.of<CartBloc>(context).add(AddToCart(foodItem));
          },
        ),
      ),
    );
  }
}
