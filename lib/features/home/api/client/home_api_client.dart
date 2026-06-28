import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeApiClient {
  Future<List<ProductDTO>> getProduct() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      ProductDTO(
        id: 1,
        name: 'Wireless Headphones',
        description: 'Premium noise-cancelling headphones',
        price: 199.99,
        imageUrl: 'https://example.com/headphones.jpg',
        category: 'Electronics',
        rating: 4.5,
      ),
      ProductDTO(
        id: 2,
        name: 'Running Shoes',
        description: 'Lightweight shoes for daily running',
        price: 89.99,
        imageUrl: 'https://example.com/shoes.jpg',
        category: 'Sports',
        rating: 4.2,
      ),
      ProductDTO(
        id: 3,
        name: 'Coffee Maker',
        description: 'Automatic drip coffee maker with timer',
        price: 49.99,
        imageUrl: 'https://example.com/coffee.jpg',
        category: 'Kitchen',
        rating: 4.7,
      ),
      ProductDTO(
        id: 4,
        name: 'Yoga Mat',
        description: 'Non-slip eco-friendly yoga mat',
        price: 29.99,
        imageUrl: 'https://example.com/yoga.jpg',
        category: 'Sports',
        rating: 4.3,
      ),
      ProductDTO(
        id: 5,
        name: 'Desk Lamp',
        description: 'LED desk lamp with adjustable brightness',
        price: 34.99,
        imageUrl: 'https://example.com/lamp.jpg',
        category: 'Home',
        rating: 4.6,
      ),
    ];
  }
}
