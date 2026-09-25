import 'package:elevate_cycle6/features/flavors/domain/entities/flavor_entity.dart';
import 'package:flutter/material.dart';

class FlavorCard extends StatelessWidget {
  const FlavorCard({super.key, required this.flavor, this.onTap});

  final FlavorEntity flavor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  flavor.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const ColoredBox(
                      color: Color(0xFFF0F0F0),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const ColoredBox(
                        color: Color(0xFFF0F0F0),
                        child: Icon(Icons.image_not_supported_outlined),
                      ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            flavor.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, size: 14, color: Colors.amber),
              const SizedBox(width: 2),
              Text(
                flavor.rating.toStringAsFixed(1),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const Spacer(),
              Text(
                '\$${flavor.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
