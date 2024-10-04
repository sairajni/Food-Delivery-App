import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/blocs/food/food_state.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_state.dart';
import '../blocs/food/food_bloc.dart';
import '../blocs/food/food_event.dart';
import '../widgets/food_item_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int itemCount = (state is CartUpdated)
                  ? state.items.fold(0, (sum, item) => sum + item.quantity)
                  : 0;
              return IconButton(
                icon: Stack(
                  children: [
                    Icon(Icons.shopping_cart),
                    if (itemCount > 0)
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            itemCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              );
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => FoodBloc()..add(LoadFoodItems()),
        child: BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state is FoodLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FoodLoaded) {
              return ListView.builder(
                itemCount: state.foodItems.length,
                itemBuilder: (context, index) {
                  final foodItem = state.foodItems[index];
                  return FoodItemWidget(foodItem: foodItem);
                },
              );
            }
            return Center(child: Text('Error loading food items.'));
          },
        ),
      ),
    );
  }
}
