import 'package:dreemz/core/helper/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dreemz/core/enums/action_state.dart';
import 'package:dreemz/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:dreemz/features/dashboard/domain/model/pixabay_image_model.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final cubit = context.read<DashboardCubit>();
      final state = cubit.state;

      if (state.currentSearchQuery.isNotEmpty) {
        // Load more search results
        cubit.loadNextPageForSearch();
      } else {
        // Load more popular images
        cubit.loadNextPageForPopular();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  if (state.state == ActionState.loading &&
                      (state.searchResults.isEmpty &&
                          state.popularImages.isEmpty)) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.state == ActionState.failed) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64.sp,
                            color: Colors.grey.shade400,
                          ),
                          SizedBox(height: 16.h),
                          BuildText(
                            text: 'Failed to load images',
                            fontSize: 16.sp,
                            color: Colors.grey.shade600,
                          ),
                          SizedBox(height: 8.h),
                          BuildText(
                            text: state.errorMessage,
                            fontSize: 14.sp,
                            color: Colors.grey.shade500,
                          ),
                        ],
                      ),
                    );
                  }

                  // Determine which list to show based on search query
                  final images = state.currentSearchQuery.isNotEmpty
                      ? state.searchResults
                      : state.popularImages;

                  return _buildImageGrid(images, state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search for images...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              context.read<DashboardCubit>().getPopularImages();
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
        onChanged: (value) {
          // Search with debounce
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              if (value.trim().isEmpty) {
                context.read<DashboardCubit>().getPopularImages();
              } else {
                context.read<DashboardCubit>().searchImages(value);
              }
            }
          });
        },
      ),
    );
  }

  Widget _buildImageGrid(List<PixabayImage> images, DashboardState state) {
    if (images.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 64.sp,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 16.h),
            BuildText(
              text: 'No images found',
              fontSize: 16.sp,
              color: Colors.grey.shade600,
            ),
            SizedBox(height: 8.h),
            BuildText(
              text: 'Try searching for something else',
              fontSize: 14.sp,
              color: Colors.grey.shade500,
            ),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels >=
            scrollInfo.metrics.maxScrollExtent - 200) {
          if (state.currentSearchQuery.isNotEmpty) {
            context.read<DashboardCubit>().loadNextPageForSearch();
          } else {
            context.read<DashboardCubit>().loadNextPageForPopular();
          }
        }
        return false;
      },
      child: GridView.builder(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 1.0,
        ),
        itemCount: images.length + (state.isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == images.length) {
            // Show loading indicator at the bottom
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          return _buildImageCard(images[index], index);
        },
      ),
    );
  }

  Widget _buildImageCard(PixabayImage image, int index) {
    return GestureDetector(
      onTap: () {
        context.read<DashboardCubit>().addToFavorites(image);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: BuildText(
              text: 'Added to favorites!',
              color: Colors.white,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Stack(
            children: [
              Image.network(
                image.webformatURL,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () async {
                    // Check if already in favorites
                    final isFavorite = await context
                        .read<DashboardCubit>()
                        .isFavorite(image.id);
                    if (isFavorite) {
                      // Remove from favorites
                      context
                          .read<DashboardCubit>()
                          .removeFromFavorites(image.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: BuildText(
                            text: 'Removed from favorites!',
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      // Add to favorites
                      context.read<DashboardCubit>().addToFavorites(image);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: BuildText(
                            text: 'Added to favorites!',
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      shape: BoxShape.circle,
                    ),
                    child: FutureBuilder<bool>(
                      future:
                          context.read<DashboardCubit>().isFavorite(image.id),
                      builder: (context, snapshot) {
                        final isFavorite = snapshot.data ?? false;
                        return Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 16.sp,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
