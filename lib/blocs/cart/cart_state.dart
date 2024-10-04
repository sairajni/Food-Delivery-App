import '/models/cart_item.dart';

abstract class CartState {
  List<CartItem> get items => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItem> cartItems;

  CartUpdated(this.cartItems);

  @override
  List<CartItem> get items => cartItems;
}
