import 'package:get/get.dart';
import '../modules/home/home_view.dart';
import '../modules/album/album_detail_view.dart';
import '../modules/photo/photo_detail_view.dart';
import '../modules/home/home_controller.dart';
import '../modules/album/album_detail_controller.dart';
import '../modules/photo/photo_detail_controller.dart';

/// Definisi semua rute dalam aplikasi
class AppPages {
  static const String home = '/';
  static const String albumDetail = '/album';
  static const String photoDetail = '/photo';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.put(HomeController());
      }),
    ),
    GetPage(
      name: '$albumDetail/:id',
      page: () => const AlbumDetailView(),
      binding: BindingsBuilder(() {
        Get.put(AlbumDetailController());
      }),
    ),
    GetPage(
      name: '$photoDetail/:id',
      page: () => const PhotoDetailView(),
      binding: BindingsBuilder(() {
        Get.put(PhotoDetailController());
      }),
    ),
  ];
}
