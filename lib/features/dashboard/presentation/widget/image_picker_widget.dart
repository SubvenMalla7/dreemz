import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:dreemz/core/helper/export.dart';
import 'package:dreemz/core/util/permission_helper.dart';
import 'package:dreemz/features/dashboard/domain/model/pixabay_image_model.dart';
import 'package:dreemz/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _showImageSourceDialog,
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.add_a_photo,
        color: Colors.white,
      ),
    );
  }

  /// Show dialog to choose image source (camera or gallery)
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const BuildText(
            text: 'Add Image',
            weight: FontWeight.bold,
          ),
          content: const BuildText(
            text: 'Choose where to get the image from:',
            fontSize: 14,
          ),
          actions: [
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImageFromCamera();
              },
              icon: const Icon(Icons.camera_alt),
              label: const BuildText(text: 'Camera'),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImageFromGallery();
              },
              icon: const Icon(Icons.photo_library),
              label: const BuildText(text: 'Gallery'),
            ),
          ],
        );
      },
    );
  }

  /// Pick image from camera
  Future<void> _pickImageFromCamera() async {
    try {
      // Check camera permission
      final hasPermission = await PermissionHelper.requestCameraPermission();
      if (!hasPermission) {
        _showPermissionDialog('Camera permission is required to take photos.');
        return;
      }

      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
      );

      if (image != null) {
        await _addLocalImageToFavorites(image.path);
      }
    } catch (e) {
      _showErrorDialog('Failed to capture image: $e');
    }
  }

  /// Pick image from gallery
  Future<void> _pickImageFromGallery() async {
    try {
      // Check storage permission
      final hasPermission = await PermissionHelper.requestStoragePermission();
      if (!hasPermission) {
        _showPermissionDialog(
            'Storage permission is required to access photos.');
        return;
      }

      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        await _addLocalImageToFavorites(image.path);
      }
    } catch (e) {
      _showErrorDialog('Failed to pick image: $e');
    }
  }

  /// Add local image to favorites
  Future<void> _addLocalImageToFavorites(String imagePath) async {
    try {
      final file = File(imagePath);
      final fileSize = await file.length();

      // Create a local image model
      final localImage = PixabayImage(
        id: DateTime.now().millisecondsSinceEpoch, // Unique local ID
        user: 'You', // Set user as "You" for local images
        webformatURL: imagePath, // Use local path
        imageSize: fileSize,
        imageWidth: 0, // Will be set when image is loaded
        imageHeight: 0, // Will be set when image is loaded
        tags: 'local, camera, gallery',
        type: 'photo',
        pageURL: '',
        previewURL: imagePath,
        previewWidth: 0,
        previewHeight: 0,
        webformatWidth: 0,
        webformatHeight: 0,
        largeImageURL: imagePath,
        fullHDURL: imagePath,
        imageURL: imagePath,
        views: 0,
        downloads: 0,
        likes: 0,
        comments: 0,
        user_id: 0,
        userImageURL: '',
      );

      // Add to favorites
      context.read<DashboardCubit>().addToFavorites(localImage);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: BuildText(
            text: 'Image added to favorites!',
            color: Colors.white,
          ),
        ),
      );
    } catch (e) {
      _showErrorDialog('Failed to add image to favorites: $e');
    }
  }

  /// Show permission dialog
  void _showPermissionDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const BuildText(
            text: 'Permission Required',
            weight: FontWeight.bold,
          ),
          content: BuildText(
            text: message,
            fontSize: 14,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const BuildText(
                text: 'Cancel',
                color: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
              child: const BuildText(
                text: 'Settings',
                color: AppColors.primaryColor,
                weight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }

  /// Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const BuildText(
            text: 'Error',
            weight: FontWeight.bold,
          ),
          content: BuildText(
            text: message,
            fontSize: 14,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const BuildText(
                text: 'OK',
                color: AppColors.primaryColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
