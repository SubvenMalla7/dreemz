import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dreemz/core/helper/export.dart';
import 'package:dreemz/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:dreemz/features/dashboard/presentation/screen/image_search_screen.dart';
import 'package:dreemz/features/dashboard/presentation/screen/fav_images_screen.dart';
import 'package:dreemz/features/dashboard/presentation/widget/image_picker_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _screens = [
    const FavImagesScreen(),
    const ImageSearchScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // Load popular images when dashboard initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardCubit>().getPopularImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: state.currentIndex,
            children: _screens,
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context, state),
          floatingActionButton:
              state.currentIndex == 0 ? const ImagePickerWidget() : null,
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, DashboardState state) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              _buildNavItem(
                context: context,
                index: 0,
                currentIndex: state.currentIndex,
                icon: Icons.favorite,
                label: 'Favorites',
                onTap: () {
                  context.read<DashboardCubit>().changeIndex(0);
                },
              ),
              const Spacer(),
              _buildNavItem(
                context: context,
                index: 1,
                currentIndex: state.currentIndex,
                icon: Icons.search,
                label: 'Search',
                onTap: () {
                  context.read<DashboardCubit>().changeIndex(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required int currentIndex,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final isSelected = index == currentIndex;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: isSelected ? AppColors.primaryColor : Colors.grey.shade600,
            ),
            SizedBox(width: 8.w),
            BuildText(
              text: label,
              fontSize: 14.sp,
              weight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? AppColors.primaryColor : Colors.grey.shade600,
            ),
          ],
        ),
      ),
    );
  }
}
