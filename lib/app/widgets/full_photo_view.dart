import 'package:flutter/material.dart';
import '../models/photo_model.dart';

/// Widget untuk menampilkan foto ukuran penuh dan judul
class FullPhotoView extends StatelessWidget {
  final Photo photo;

  const FullPhotoView({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            photo.url,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loading) {
              if (loading == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                'https://placehold.co/400x700.png?text=No+Image',
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            border: Border(top: BorderSide(color: Colors.black, width: 2)),
          ),
          child: Text(
            photo.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
