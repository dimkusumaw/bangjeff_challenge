import 'package:flutter/material.dart';
import '../models/photo_model.dart';

/// Widget kotak foto di grid (thumbnail)
class PhotoGridItem extends StatelessWidget {
  final Photo photo;
  final VoidCallback onTap;

  const PhotoGridItem({super.key, required this.photo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          photo.thumbnailUrl,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loading) {
            if (loading == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              'https://placehold.co/150x150.png?text=No+Image',
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
