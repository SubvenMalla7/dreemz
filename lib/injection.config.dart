// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dreemz/core/api/request_client.dart' as _i1023;
import 'package:dreemz/features/dashboard/data/api/pixabay_api_service.dart'
    as _i774;
import 'package:dreemz/features/dashboard/data/repository_impl/dashboard_repository_impl.dart'
    as _i633;
import 'package:dreemz/features/dashboard/data/service/favorites_service.dart'
    as _i324;
import 'package:dreemz/features/dashboard/domain/repository/dashboard_repository.dart'
    as _i781;
import 'package:dreemz/features/dashboard/domain/usecase/get_popular_images_usecase.dart'
    as _i595;
import 'package:dreemz/features/dashboard/domain/usecase/search_images_usecase.dart'
    as _i353;
import 'package:dreemz/features/dashboard/presentation/cubit/dashboard_cubit.dart'
    as _i318;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1023.RequestClient>(() => _i1023.RequestClient());
    gh.factory<_i774.PixabayApiService>(() => _i774.PixabayApiService());
    gh.factory<_i324.FavoritesService>(() => _i324.FavoritesService());
    gh.factory<_i781.DashboardRepository>(
        () => _i633.DashboardRepositoryImpl(gh<_i1023.RequestClient>()));
    gh.factory<_i353.SearchImagesUseCase>(
        () => _i353.SearchImagesUseCase(gh<_i781.DashboardRepository>()));
    gh.factory<_i595.GetPopularImagesUseCase>(
        () => _i595.GetPopularImagesUseCase(gh<_i781.DashboardRepository>()));
    gh.factory<_i318.DashboardCubit>(() => _i318.DashboardCubit(
          gh<_i353.SearchImagesUseCase>(),
          gh<_i595.GetPopularImagesUseCase>(),
          gh<_i324.FavoritesService>(),
        ));
    return this;
  }
}
