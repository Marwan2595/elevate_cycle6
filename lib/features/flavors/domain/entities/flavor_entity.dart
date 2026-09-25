class FlavorEntity {
  final String id;
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final double rating;

  FlavorEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });

  @override
  String toString() {
    return 'FlavorEntity(id: $id, name: $name, price: $price, rating: $rating)';
  }
}
