import 'package:get/get.dart';
import '../../models/album_model.dart';
import '../../models/user_model.dart';
import '../../services/api_service.dart';
// import 'package:flutter/material.dart';
/// Controller untuk HomeView - mengelola data album dan user
class HomeController extends GetxController {
  final ApiService _apiService = ApiService();

  var albums = <Album>[].obs;
  var users = <User>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlbumsAndUsers();
  }

  /// Ambil data album dan user dari API
Future fetchAlbumsAndUsers() async {
  try {
    isLoading(true);
    final fetchedAlbums = await _apiService.getAlbums();
    final fetchedUsers = await _apiService.getUsers();

    // debugPrint("Albums fetched: ${fetchedAlbums.length}");
    // debugPrint("Users fetched: ${fetchedUsers.length}");

    albums.value = fetchedAlbums;
    users.value = fetchedUsers;
  } catch (e) {
    // debugPrint("Error fetching data: $e");
    Get.snackbar('Error', e.toString().replaceAll('Exception: ', ''));
  } finally {
    isLoading(false);
  }
}

  /// Dapatkan username dari userId
  String getUsername(int userId) {
    return users.firstWhereOrNull((u) => u.id == userId)?.username ?? 'Unknown';
  }
}