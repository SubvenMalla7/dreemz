import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:dreemz/core/enums/action_state.dart';
import 'package:dreemz/features/dashboard/domain/enitity/pixabay_image_entity.dart';
import 'package:dreemz/features/dashboard/domain/usecase/search_images_usecase.dart';
import 'package:dreemz/features/dashboard/domain/usecase/get_popular_images_usecase.dart';
import 'package:dreemz/features/dashboard/data/service/favorites_service.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(
    this._searchImagesUseCase,
    this._getPopularImagesUseCase,
    this._favoritesService,
  ) : super(const DashboardState());

  final SearchImagesUseCase _searchImagesUseCase;
  final GetPopularImagesUseCase _getPopularImagesUseCase;
  final FavoritesService _favoritesService;

  /// Change the current bottom navigation index
  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  /// Get current index
  int get currentIndex => state.currentIndex;

  /// Search for images with pagination
  Future<void> searchImages(String query) async {
    if (query.trim().isEmpty) {
      await getPopularImages();
      return;
    }

    emit(state.copyWith(
      state: ActionState.loading,
      currentSearchQuery: query,
    ));

    final result = await _searchImagesUseCase.call(
      query: query,
      isNewSearch: true,
      perPage: 20,
    );

    result.fold(
      (l) {
        emit(state.copyWith(
          state: ActionState.failed,
          errorMessage: l.message ?? "Failed to search images",
        ));
      },
      (r) {
        if (r.data != null) {
          emit(state.copyWith(
            state: ActionState.success,
            searchResults: _searchImagesUseCase.searchResults,
            totalHits: _searchImagesUseCase.totalHits,
            currentPage: _searchImagesUseCase.currentPage,
            hasMorePages: _searchImagesUseCase.hasMorePages,
            isLoadingMore: false,
          ));
        }
      },
    );
  }

  /// Load next page for search results
  Future<void> loadNextPageForSearch() async {
    if (!_searchImagesUseCase.canLoadMore()) return;

    emit(state.copyWith(isLoadingMore: true));

    final result = await _searchImagesUseCase.loadNextPage();

    result.fold(
      (l) {
        emit(state.copyWith(
          state: ActionState.failed,
          errorMessage: l.message ?? "Failed to load more images",
          isLoadingMore: false,
        ));
      },
      (r) {
        if (r.data != null) {
          emit(state.copyWith(
            searchResults: _searchImagesUseCase.searchResults,
            totalHits: _searchImagesUseCase.totalHits,
            currentPage: _searchImagesUseCase.currentPage,
            hasMorePages: _searchImagesUseCase.hasMorePages,
            isLoadingMore: false,
          ));
        }
      },
    );
  }

  /// Get popular images with pagination
  Future<void> getPopularImages() async {
    emit(state.copyWith(
      state: ActionState.loading,
      currentSearchQuery: '',
    ));

    final result = await _getPopularImagesUseCase.call(
      isNewRequest: true,
      perPage: 20,
    );

    result.fold(
      (l) {
        emit(state.copyWith(
          state: ActionState.failed,
          errorMessage: l.message ?? "Failed to get popular images",
        ));
      },
      (r) {
        if (r.data != null) {
          emit(state.copyWith(
            state: ActionState.success,
            popularImages: _getPopularImagesUseCase.popularImages,
            totalHits: _getPopularImagesUseCase.totalHits,
            currentPage: _getPopularImagesUseCase.currentPage,
            hasMorePages: _getPopularImagesUseCase.hasMorePages,
            isLoadingMore: false,
          ));
        }
      },
    );
  }

  /// Load next page for popular images
  Future<void> loadNextPageForPopular() async {
    if (!_getPopularImagesUseCase.canLoadMore()) return;

    emit(state.copyWith(isLoadingMore: true));

    final result = await _getPopularImagesUseCase.loadNextPage();

    result.fold(
      (l) {
        emit(state.copyWith(
          state: ActionState.failed,
          errorMessage: l.message ?? "Failed to load more images",
          isLoadingMore: false,
        ));
      },
      (r) {
        if (r.data != null) {
          emit(state.copyWith(
            popularImages: _getPopularImagesUseCase.popularImages,
            totalHits: _getPopularImagesUseCase.totalHits,
            currentPage: _getPopularImagesUseCase.currentPage,
            hasMorePages: _getPopularImagesUseCase.hasMorePages,
            isLoadingMore: false,
          ));
        }
      },
    );
  }

  /// Load favorites
  Future<void> loadFavorites() async {
    emit(state.copyWith(state: ActionState.loading));

    try {
      final favorites = await _favoritesService.getFavorites();
      emit(state.copyWith(
        state: ActionState.success,
        favorites: favorites,
      ));
    } catch (e) {
      emit(state.copyWith(
        state: ActionState.failed,
        errorMessage: 'Failed to load favorites',
      ));
    }
  }

  /// Add to favorites
  Future<void> addToFavorites(PixabayImage image) async {
    try {
      final success = await _favoritesService.addToFavorites(image);
      if (success) {
        await loadFavorites(); // Reload favorites
      }
    } catch (e) {
      // Handle error silently for now
    }
  }

  /// Remove from favorites
  Future<void> removeFromFavorites(int imageId) async {
    try {
      final success = await _favoritesService.removeFromFavorites(imageId);
      if (success) {
        await loadFavorites(); // Reload favorites
      }
    } catch (e) {
      // Handle error silently for now
    }
  }

  /// Check if image is favorite
  Future<bool> isFavorite(int imageId) async {
    return await _favoritesService.isFavorite(imageId);
  }
}
