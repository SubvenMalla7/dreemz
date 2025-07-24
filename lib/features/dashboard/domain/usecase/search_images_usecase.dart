import 'package:dreemz/core/helper/app_type_def.dart';
import 'package:injectable/injectable.dart';
import 'package:dreemz/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:dreemz/features/dashboard/domain/enitity/pixabay_image_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dreemz/core/api/data_response.dart';

@injectable
class SearchImagesUseCase {
  SearchImagesUseCase(this._dashboardRepository);

  final DashboardRepository _dashboardRepository;

  // Pagination state
  int _currentPage = 1;
  bool _hasMorePages = true;
  bool _isLoading = false;
  String _currentQuery = '';

  // Separate list for search results
  final List<PixabayImage> _searchResults = [];
  int _totalHits = 0;

  // Getters
  int get currentPage => _currentPage;
  bool get hasMorePages => _hasMorePages;
  bool get isLoading => _isLoading;
  String get currentQuery => _currentQuery;
  List<PixabayImage> get searchResults => List.unmodifiable(_searchResults);
  int get totalHits => _totalHits;

  /// Reset pagination state for new search
  void resetPagination() {
    _currentPage = 1;
    _hasMorePages = true;
    _searchResults.clear();
    _totalHits = 0;
  }

  /// Set current query
  void setQuery(String query) {
    _currentQuery = query;
  }

  /// Search for images with pagination
  EitherResponse call({
    required String query,
    bool isNewSearch = false,
    int? perPage,
  }) async {
    if (isNewSearch) {
      resetPagination();
      setQuery(query);
    }

    if (_isLoading || (!_hasMorePages && !isNewSearch)) {
      return Future.value(Right(DataResponse<String>.success('')));
    }

    _isLoading = true;

    final result = await _dashboardRepository.searchImages(
      query: query,
      page: _currentPage,
      perPage: perPage ?? 20,
    );

    _isLoading = false;

    result.fold(
      (error) => error,
      (success) {
        if (success.data != null) {
          final newImages = success.data!.hits ?? [];
          _searchResults.addAll(newImages);
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
    if (_currentQuery.isEmpty)
      return Future.value(Right(DataResponse<String>.success('')));
    return call(query: _currentQuery, isNewSearch: false);
  }

  /// Check if can load more
  bool canLoadMore() {
    return _hasMorePages && !_isLoading;
  }
}
