import '/models/food_item.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final FoodItem foodItem;

  AddToCart(this.foodItem);
}

class RemoveFromCart extends CartEvent {
  final FoodItem foodItem;

  RemoveFromCart(this.foodItem);
}
