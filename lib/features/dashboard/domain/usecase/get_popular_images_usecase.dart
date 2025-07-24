import 'package:dreemz/core/helper/app_type_def.dart';
import 'package:injectable/injectable.dart';
import 'package:dreemz/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:dreemz/features/dashboard/domain/model/pixabay_image_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dreemz/core/api/data_response.dart';

@injectable
class GetPopularImagesUseCase {
  GetPopularImagesUseCase(this._dashboardRepository);

  final DashboardRepository _dashboardRepository;

  // Pagination state
  int _currentPage = 1;
  bool _hasMorePages = true;
  bool _isLoading = false;

  // Separate list for popular images
  final List<PixabayImage> _popularImages = [];
  int _totalHits = 0;

  // Getters
  int get currentPage => _currentPage;
  bool get hasMorePages => _hasMorePages;
  bool get isLoading => _isLoading;
  List<PixabayImage> get popularImages => List.unmodifiable(_popularImages);
  int get totalHits => _totalHits;

  /// Reset pagination state
  void resetPagination() {
    _currentPage = 1;
    _hasMorePages = true;
    _popularImages.clear();
    _totalHits = 0;
  }

  /// Get popular images with pagination
  EitherResponse call({
    bool isNewRequest = false,
    int? perPage,
  }) async {
    if (isNewRequest) {
      resetPagination();
    }

    if (_isLoading || (!_hasMorePages && !isNewRequest)) {
      return Future.value(Right(DataResponse<String>.success('')));
    }

    _isLoading = true;

    final result = await _dashboardRepository.getPopularImages(
      page: _currentPage,
      perPage: perPage ?? 20,
    );

    _isLoading = false;

    result.fold(
      (error) => error,
      (success) {
        if (success.data != null) {
          final newImages = success.data!.hits ?? [];
          _popularImages.addAll(newImages);
          _totalHits = success.data!.totalHits ?? 0;

          // Check if there are more pages
          if (newImages.length < (perPage ?? 20)) {
            _hasMorePages = false;
          } else {
            _currentPage++;
          }
        }
        return success;
      },
    );

    return result;
  }

  /// Load next page
  EitherResponse loadNextPage() {
    return call(isNewRequest: false);
  }

  /// Check if can load more
  bool canLoadMore() {
    return _hasMorePages && !_isLoading;
  }
}
