import 'dart:io';
import 'package:dreemz/core/helper/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dreemz/core/enums/action_state.dart';
import 'package:dreemz/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:dreemz/features/dashboard/domain/enitity/pixabay_image_entity.dart';

class FavImagesScreen extends StatefulWidget {
  const FavImagesScreen({super.key});

  @override
  State<FavImagesScreen> createState() => _FavImagesScreenState();
}

class _FavImagesScreenState extends State<FavImagesScreen> {
  @override
  void initState() {
    super.initState();
    // Load favorites when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardCubit>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: BlocBuilder<DashboardCubit, DashboardState>(
                builder: (context, state) {
                  if (state.state == ActionState.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state.favorites.isEmpty) {
                    return _buildEmptyState();
                  }

                  return _buildFavoritesGrid(state.favorites);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Icon(
            Icons.favorite,
            color: AppColors.red,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          BuildText(
            text: 'Favorite Images',
            fontSize: 20.sp,
            weight: FontWeight.bold,
          ),
          const Spacer(),
          BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) {
              return BuildText(
                text: '${state.favorites.length} items',
                fontSize: 14.sp,
                color: Colors.grey,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80.sp,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: 16.h),
          BuildText(
            text: 'Your favorite list is empty',
            fontSize: 18.sp,
            weight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
          SizedBox(height: 8.h),
          BuildText(
            text: 'Start adding images to your favorites',
            fontSize: 14.sp,
            color: Colors.grey.shade500,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildFavoritesGrid(List<PixabayImage> favorites) {
    return GridView.builder(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.8, // Adjusted for image info
      ),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return _buildFavoriteImageCard(favorites[index], index);
      },
    );
  }

  Widget _buildFavoriteImageCard(PixabayImage image, int index) {
    return GestureDetector(
      onTap: () {
        _showRemoveConfirmationDialog(image);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    _buildImageWidget(image),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.8),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 16.sp,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Image information
              Container(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Owner name
                    BuildText(
                      text: image.user.isNotEmpty ? image.user : 'Unknown',
                      fontSize: 12.sp,
                      weight: FontWeight.w500,
                      color: Colors.grey.shade700,
                      maxLines: 1,
                    ),
                    SizedBox(height: 2.h),
                    // Image size
                    BuildText(
                      text: FileUtils.formatFileSize(image.imageSize),
                      fontSize: 10.sp,
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWidget(PixabayImage image) {
    final isLocalImage =
        image.user == 'You' && image.webformatURL.startsWith('/');

    if (isLocalImage) {
      return Image.file(
        File(image.webformatURL),
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
      );
    } else {
      return Image.network(
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
      );
    }
  }

  /// Show confirmation dialog for removing image from favorites
  void _showRemoveConfirmationDialog(PixabayImage image) {
    final isLocalImage =
        image.user == 'You' && image.webformatURL.startsWith('/');
    final message = isLocalImage
        ? 'Do you want to remove this image from your favorites? This will also delete the image file from your device.'
        : 'Do you want to remove this image from your favorites?';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const BuildText(
            text: 'Remove from Favorites',
            weight: FontWeight.bold,
          ),
          content: BuildText(
            text: message,
            fontSize: 14.sp,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const BuildText(
                text: 'NO',
                color: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<DashboardCubit>().removeFromFavorites(image.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: BuildText(
                      text: isLocalImage
                          ? 'Removed from favorites and deleted from device!'
                          : 'Removed from favorites!',
                      color: Colors.white,
                    ),
                  ),
                );
              },
              child: const BuildText(
                text: 'YES',
                color: AppColors.red,
                weight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }
}
