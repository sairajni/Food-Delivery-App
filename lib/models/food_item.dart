class FoodItem {
  final String id;
  final String name;
  final String imageUrl; // This will hold the local asset path
  final double price;

  FoodItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}
