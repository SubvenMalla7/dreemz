import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dreemz/core/api/data_response.dart';
import 'package:dreemz/features/dashboard/domain/model/pixabay_image_model.dart';

@injectable
class PixabayApiService {
  static const String _baseUrl = 'https://pixabay.com/api/';
  static const String _apiKey =
      '51465394-3e58cad945f8d4f5a5cef6794'; // TODO: Add your API key here

  final Dio _dio = Dio();

  /// Search for images using Pixabay API
  /// Based on documentation: https://pixabay.com/api/docs/
  Future<DataResponse<PixabayResponse>> searchImages({
    required String query,
    String? imageType,
    String? orientation,
    String? category,
    int? minWidth,
    int? minHeight,
    String? colors,
    bool? editorsChoice,
    bool? safeSearch,
    String? order,
    int? page,
    int? perPage,
  }) async {
    try {
      final Map<String, dynamic> queryParameters = {
        'key': _apiKey,
        'q': query,
      };

      // Add optional parameters if provided
      if (imageType != null) queryParameters['image_type'] = imageType;
      if (orientation != null) queryParameters['orientation'] = orientation;
      if (category != null) queryParameters['category'] = category;
      if (minWidth != null) queryParameters['min_width'] = minWidth;
      if (minHeight != null) queryParameters['min_height'] = minHeight;
      if (colors != null) queryParameters['colors'] = colors;
      if (editorsChoice != null)
        queryParameters['editors_choice'] = editorsChoice;
      if (safeSearch != null) queryParameters['safesearch'] = safeSearch;
      if (order != null) queryParameters['order'] = order;
      if (page != null) queryParameters['page'] = page;
      if (perPage != null) queryParameters['per_page'] = perPage;

      final response = await _dio.get(
        _baseUrl,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        final pixabayResponse = PixabayResponse.fromJson(response.data);
        return DataResponse.success(pixabayResponse);
      } else {
        return DataResponse.error(
          'Failed to fetch images: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        return DataResponse.error(
          'Rate limit exceeded. Please try again later.',
        );
      }
      return DataResponse.error(
        'Network error: ${e.message}',
      );
    } catch (e) {
      return DataResponse.error(
        'Unexpected error: $e',
      );
    }
  }

  /// Get popular images (no search query)
  Future<DataResponse<PixabayResponse>> getPopularImages({
    int? page,
    int? perPage,
  }) async {
    return searchImages(
      query: '',
      page: page,
      perPage: perPage,
    );
  }
}
