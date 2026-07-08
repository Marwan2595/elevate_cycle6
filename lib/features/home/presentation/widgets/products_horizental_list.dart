import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:elevate_cycle6/features/home/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsHorizontalList extends StatelessWidget {
  const ProductsHorizontalList({
    super.key,
    required this.title,
    required this.products,
    this.onProductTap,
  });

  final String title;
  final List<ProductEntity> products;
  final ValueChanged<ProductEntity>? onProductTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
                onTap: onProductTap == null
                    ? null
                    : () => onProductTap!(product),
              );
            },
          ),
        ),
      ],
    );
  }
}
