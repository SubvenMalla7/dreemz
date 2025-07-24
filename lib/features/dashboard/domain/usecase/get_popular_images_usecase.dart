import 'package:dreemz/core/helper/app_type_def.dart';
import 'package:injectable/injectable.dart';
import 'package:dreemz/features/dashboard/domain/repository/dashboard_repository.dart';

@injectable
class GetPopularImagesUseCase {
  GetPopularImagesUseCase(this._dashboardRepository);

  final DashboardRepository _dashboardRepository;

  EitherResponse call({
    int? page,
    int? perPage,
  }) async {
    return await _dashboardRepository.getPopularImages(
      page: page,
      perPage: perPage,
    );
  }
}
