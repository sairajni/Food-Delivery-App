import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/models/cart_item.dart';
import 'cart_event.dart';
import 'cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCart>((event, emit) {
      print('AddToCart event triggered for: ${event.foodItem.name}');
      
      final currentItems = (state is CartUpdated) ? (state as CartUpdated).cartItems : [];
      final index = currentItems.indexWhere((item) => item.foodItem.id == event.foodItem.id);

      if (index != -1) {
        currentItems[index].quantity++;
        print('Increased quantity for: ${currentItems[index].foodItem.name} to ${currentItems[index].quantity}');
      } else {
        currentItems.add(CartItem(foodItem: event.foodItem, quantity: 1));
        print('Added new item to cart: ${event.foodItem.name}');
      }
      
      emit(CartUpdated(List.from(currentItems)));
      print('Cart updated: ${currentItems.length} items');
    });

    on<RemoveFromCart>((event, emit) {
      print('RemoveFromCart event triggered for: ${event.foodItem.name}');

      final currentItems = (state is CartUpdated) ? (state as CartUpdated).cartItems : [];
      final index = currentItems.indexWhere((item) => item.foodItem.id == event.foodItem.id);

      if (index != -1) {
        if (currentItems[index].quantity > 1) {
          currentItems[index].quantity--;
          print('Decreased quantity for: ${currentItems[index].foodItem.name} to ${currentItems[index].quantity}');
        } else {
          currentItems.removeAt(index);
          print('Removed item from cart: ${event.foodItem.name}');
        }
      }
      emit(CartUpdated(List.from(currentItems)));
      print('Cart updated: ${currentItems.length} items');
    });
  }
}
