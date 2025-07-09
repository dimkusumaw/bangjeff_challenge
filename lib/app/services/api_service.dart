import 'package:dio/dio.dart';
import '../models/album_model.dart';
import '../models/user_model.dart';
import '../models/photo_model.dart';

/// Service class untuk mengambil data dari jsonplaceholder API
class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  /// Mengambil list album dari endpoint /albums
  Future<List<Album>> getAlbums() async {
    try {
      final response = await _dio.get('/albums');
      final List data = response.data;
      return data.map((json) => Album.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch albums');
    }
  }

  /// Mengambil list user dari endpoint /users
  Future<List<User>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      final List data = response.data;
      return data.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }

  /// Mengambil list photo berdasarkan albumId dari endpoint /photos?albumId=X
  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    try {
      final response = await _dio.get(
        '/photos',
        queryParameters: {'albumId': albumId},
      );
      final List data = response.data;
      return data.map((json) => Photo.fromJson(json)).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Connection timed out. Please try again later.');
      } else if (e.type == DioExceptionType.unknown) {
        throw Exception('No internet connection or unknown error.');
      } else {
        throw Exception('Failed to fetch photos');
      }
    } catch (e) {
      throw Exception('Unexpected error');
    }
  }

Future<Photo> getPhotoById(int id) async {
  try {
    final response = await _dio.get('/photos/$id');
    return Photo.fromJson(response.data);
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      throw Exception('Connection timed out. Please try again later.');
    } else if (e.type == DioExceptionType.unknown) {
      throw Exception('No internet connection or unknown error.');
    } else {
      throw Exception('Failed to fetch photo');
    }
  } catch (e) {
    throw Exception('Unexpected error');
  }
}
}
