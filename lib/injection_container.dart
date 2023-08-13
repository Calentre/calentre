import 'package:calentre/config/constants/constants.dart';
import 'package:calentre/core/DTOs/user_dto.dart';
import 'package:calentre/features/auth/data/data_sources/auth_service.dart';
import 'package:calentre/features/auth/data/repository/auth_repository_impl.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';
import 'package:calentre/features/auth/domain/usescases/sign_in_with_google.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<UserDTO>(UserDTO(email: ''));
  sl.registerSingleton<RemoteURLs>(RemoteURLs());
  sl.registerSingleton<AuthService>(AuthService(sl(), sl(), sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<SignInWithGoogleUseCase>(SignInWithGoogleUseCase(sl()));

  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
}
