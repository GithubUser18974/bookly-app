import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/core/utils/api_service.dart';
import 'package:untitled/features/home/data/repos/home_repo_imple.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt.get<ApiService>()),
  );
}
