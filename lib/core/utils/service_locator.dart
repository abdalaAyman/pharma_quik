import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/Home/data/repos/home_repo_imple.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<APIService>(
    APIService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<APIService>(),
    ),
  );
}
