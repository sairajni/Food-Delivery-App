import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/models/food_item.dart';
import 'food_event.dart';
import 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodLoading()) {
    on<LoadFoodItems>((event, emit) async {
      // Simulating data fetching
      await Future.delayed(Duration(seconds: 1));
      emit(FoodLoaded(_getFoodItems()));
    });
  }

  List<FoodItem> _getFoodItems() {
  return [
    FoodItem(id: '1', name: 'Banana', imageUrl: 'assets/images/banana.png', price: 8.99),
    FoodItem(id: '2', name: 'Candies', imageUrl: 'assets/images/candies.png', price: 5.99),
    FoodItem(id: '3', name: 'Cookie', imageUrl: 'assets/images/cookie.png', price: 7.99),
    FoodItem(id: '4', name: 'Dessert', imageUrl: 'assets/images/dessert.png', price: 4.99),
  ];
}
}
