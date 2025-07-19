import 'package:bookly_app/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/data/repos/home_repos_impl.dart';
import 'package:bookly_app/Features/search/data/data_source/search_local_data_source.dart';
import 'package:bookly_app/Features/search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.asNewInstance();
void setupServiceRelocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeReposImpl>(
    HomeReposImpl(
      HomeLocalDataSourceImpl(),
      HomeRemoteDataSourceImpl(getIt.get<ApiServices>()),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      SearchRemoteDataSourceImpl(getIt.get<ApiServices>()),
      SearchLocalDataSourceImpl(),
    ),
  );
}
