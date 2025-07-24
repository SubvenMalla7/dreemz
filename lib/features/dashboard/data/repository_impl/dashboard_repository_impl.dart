import 'package:dreemz/core/api/request_client.dart';
import 'package:dreemz/core/api/response.dart';
import 'package:dreemz/core/helper/app_type_def.dart';
import 'package:injectable/injectable.dart';
import 'package:dreemz/features/dashboard/domain/enitity/pixabay_image_entity.dart';
import 'package:dreemz/features/dashboard/domain/repository/dashboard_repository.dart';

@Injectable(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl(this._client);

  final RequestClient _client;

  static const String _apiKey = '51465394-3e58cad945f8d4f5a5cef6794';

  @override
  EitherResponse searchImages({
    required String query,
    int? page,
    int? perPage,
  }) async {
    var request = _client.get(endPoint: "", queryParameters: {
      'key': _apiKey,
      'q': query,
      'page': page,
      'per_page': perPage,
    });
    return await handleNetworkCall(request, PixabayResponse.fromJson);
  }

  @override
  EitherResponse getPopularImages({
    int? page,
    int? perPage,
  }) async {
    var request = _client.get(endPoint: "", queryParameters: {
      'key': _apiKey,
      'page': page,
      'per_page': perPage,
    });
    return await handleNetworkCall(request, PixabayResponse.fromJson);
  }
}
