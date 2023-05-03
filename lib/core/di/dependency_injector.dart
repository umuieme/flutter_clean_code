import 'package:clean_code_architecture/core/network/api/dio_helper.dart';
import 'package:clean_code_architecture/core/network/network_info.dart';
import 'package:clean_code_architecture/features/user_listing/data/datasources/user_remote_data_source.dart';
import 'package:clean_code_architecture/features/user_listing/data/repositories/user_repository_impl.dart';
import 'package:clean_code_architecture/features/user_listing/domain/repositories/user_repository.dart';
import 'package:clean_code_architecture/features/user_listing/domain/usecases/get_user_list_usecase.dart';
import 'package:clean_code_architecture/features/user_listing/presentation/bloc/user_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // bloc
  sl.registerFactory(() => UserListBloc(getUserListUseCase: sl()));

  // usecases
  sl.registerLazySingleton(() => GetUserListUseCase(sl()));

  // repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl()),
  );

  // data sources
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(dio: sl()));
// third party
  sl.registerLazySingleton(() => Dio());
  // utils
  sl.registerSingleton(DioHelper(sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
