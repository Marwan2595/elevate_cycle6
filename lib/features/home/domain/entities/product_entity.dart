class ProductEntity {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.rating,
  });

  @override
  String toString() {
    return 'ProductEntity(id: $id, name: $name,  price: $price,  category: $category, rating: $rating)';
  }
}
