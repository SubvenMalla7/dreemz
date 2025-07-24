import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:dreemz/features/dashboard/domain/enitity/pixabay_image_entity.dart';

@injectable
class FavoritesService {
  static const String _favoritesKey = 'favorite_images';

  /// Get all favorite images
  Future<List<PixabayImage>> getFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];

      return favoritesJson
          .map((json) => PixabayImage.fromJson(jsonDecode(json)))
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Add image to favorites
  Future<bool> addToFavorites(PixabayImage image) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();

      // Check if image is already in favorites
      if (favorites.any((fav) => fav.id == image.id)) {
        return true; // Already in favorites
      }

      favorites.add(image);
      final favoritesJson =
          favorites.map((image) => jsonEncode(image.toJson())).toList();

      return await prefs.setStringList(_favoritesKey, favoritesJson);
    } catch (e) {
      return false;
    }
  }

  /// Remove image from favorites
  Future<bool> removeFromFavorites(int imageId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = await getFavorites();

      // Find the image to check if it's a local image
      final imageToRemove = favorites.firstWhere(
        (image) => image.id == imageId,
        orElse: () => throw Exception('Image not found'),
      );

      // If it's a local image, delete the file
      if (imageToRemove.user == 'You' &&
          imageToRemove.webformatURL.startsWith('/')) {
        try {
          final file = File(imageToRemove.webformatURL);
          if (await file.exists()) {
            await file.delete();
          }
        } catch (e) {
          // Continue even if file deletion fails
          print('Failed to delete local image file: $e');
        }
      }

      favorites.removeWhere((image) => image.id == imageId);
      final favoritesJson =
          favorites.map((image) => jsonEncode(image.toJson())).toList();

      return await prefs.setStringList(_favoritesKey, favoritesJson);
    } catch (e) {
      return false;
    }
  }

  /// Check if image is in favorites
  Future<bool> isFavorite(int imageId) async {
    try {
      final favorites = await getFavorites();
      return favorites.any((image) => image.id == imageId);
    } catch (e) {
      return false;
    }
  }

  /// Get favorites count
  Future<int> getFavoritesCount() async {
    try {
      final favorites = await getFavorites();
      return favorites.length;
    } catch (e) {
      return 0;
    }
  }

  /// Clear all favorites
  Future<bool> clearFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(_favoritesKey);
    } catch (e) {
      return false;
    }
  }
}
