import 'package:get/get.dart';
import '../../models/photo_model.dart';
import '../../services/api_service.dart';

/// Controller untuk AlbumDetail - ambil foto dari album tertentu
class AlbumDetailController extends GetxController {
  final ApiService _apiService = ApiService();

  var photos = <Photo>[].obs;
  var isLoading = false.obs;
  late int albumId;

  @override
  void onInit() {
    super.onInit();
    albumId = int.parse(Get.parameters['id']!);
    fetchPhotos();
  }

  /// Ambil semua foto berdasarkan albumId
  void fetchPhotos() async {
    try {
      isLoading(true);
      photos.value = await _apiService.getPhotosByAlbumId(albumId);
    } catch (e) {
       Get.snackbar('Error', e.toString().replaceAll('Exception: ', ''));
    } finally {
      isLoading(false);
    }
  }
}