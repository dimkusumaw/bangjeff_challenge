import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/album_tile.dart';
import 'home_controller.dart';

/// Tampilan utama daftar album dalam grid 2x2
class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(height: 4, color: Colors.black),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.albums.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: controller.fetchAlbumsAndUsers,
          child: controller.albums.isEmpty
              ? ListView(
                  children: const [
                    SizedBox(height: 200),
                    Center(
                      child: Text(
                        'No albums found.\nSwipe down to refresh.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: controller.albums.length,
                  itemBuilder: (context, index) {
                    final album = controller.albums[index];
                    final username = controller.getUsername(album.userId);

                    return AlbumTile(
                      album: album,
                      username: username,
                      onTap: () => Get.toNamed('/album/${album.id}'),
                    );
                  },
                ),
        );
      }),
    );
  }
}
