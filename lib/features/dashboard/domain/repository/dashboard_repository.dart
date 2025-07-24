import 'package:dreemz/core/helper/app_type_def.dart';

abstract class DashboardRepository {
  /// Search for images using Pixabay API
  EitherResponse searchImages({
    required String query,
    int? page,
    int? perPage,
  });

  /// Get popular images
  EitherResponse getPopularImages({
    int? page,
    int? perPage,
  });
}
