import 'package:get/get.dart';
import '../../models/photo_model.dart';
import '../../services/api_service.dart';

/// Controller untuk menampilkan detail foto berdasarkan photoId
class PhotoDetailController extends GetxController {
  final ApiService _apiService = ApiService();

  var photo = Rxn<Photo>();
  var isLoading = false.obs;
  late int photoId;

  @override
  void onInit() {
    super.onInit();
    photoId = int.parse(Get.parameters['id']!);
    fetchPhoto();
  }

  /// Ambil data photo by ID
  void fetchPhoto() async {
    try {
      isLoading(true);
      // ✅ Panggil method yang benar dari ApiService
      photo.value = await _apiService.getPhotoById(photoId);
    } catch (e) {
       Get.snackbar('Error', e.toString().replaceAll('Exception: ', ''));
    } finally {
      isLoading(false);
    }
  }
}