import 'package:flutter/material.dart';
import '../models/album_model.dart';

class AlbumTile extends StatelessWidget {
  final Album album;
  final String username;
  final VoidCallback onTap;

  const AlbumTile({
    super.key,
    required this.album,
    required this.username,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87, // pastel
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.photo_library, size: 32, color: Color(0xFFEEEEEE)),
              const SizedBox(height: 8),
              Text(
                album.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFEEEEEE),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'by $username',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFEEEEEE),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}