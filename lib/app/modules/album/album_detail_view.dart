import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/photo_grid_item.dart';
import 'album_detail_controller.dart';
import '../../widgets/comic_back_button.dart';

/// Tampilan detail album - menampilkan grid foto
class AlbumDetailView extends GetView<AlbumDetailController> {
  const AlbumDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ComicBackButton(),
        title: const Text('Album Photos'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(height: 4, color: Colors.black),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.75,
          ),
          itemCount: controller.photos.length,
          itemBuilder: (context, index) {
            final photo = controller.photos[index];

            return PhotoGridItem(
              photo: photo,
              onTap: () {
                Get.toNamed('/photo/${photo.id}');
              },
            );
          },
        );
      }),
    );
  }
}
