import 'package:dreemz/core/helper/app_type_def.dart';
import 'package:injectable/injectable.dart';
import 'package:dreemz/features/dashboard/domain/repository/dashboard_repository.dart';

@injectable
class SearchImagesUseCase {
  SearchImagesUseCase(this._dashboardRepository);

  final DashboardRepository _dashboardRepository;

  int page = 1;

  EitherResponse call({
    required String query,
    int? page,
    int? perPage,
  }) async {
    return await _dashboardRepository.searchImages(
      query: query,
      page: page,
      perPage: perPage,
    );
  }
}
