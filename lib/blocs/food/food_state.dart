import '/models/food_item.dart';

abstract class FoodState {}

class FoodLoading extends FoodState {}

class FoodLoaded extends FoodState {
  final List<FoodItem> foodItems;

  FoodLoaded(this.foodItems);
}
