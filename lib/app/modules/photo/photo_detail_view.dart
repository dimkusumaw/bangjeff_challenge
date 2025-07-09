import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/full_photo_view.dart';
import 'photo_detail_controller.dart';
import '../../widgets/comic_back_button.dart';
/// Tampilan detail foto - menampilkan gambar besar dan judul
class PhotoDetailView extends GetView<PhotoDetailController> {
  const PhotoDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ComicBackButton(),
        title: const Text('Photo Detail'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(height: 4, color: Colors.black),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value || controller.photo.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return FullPhotoView(photo: controller.photo.value!);
      }),
    );
  }
}
