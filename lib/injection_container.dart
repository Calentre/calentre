import 'package:calentre/config/constants/constants.dart';
import 'package:calentre/features/auth/data/data_sources/auth_service.dart';
import 'package:calentre/features/auth/data/repository/auth_repository_impl.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';
import 'package:calentre/features/auth/domain/usescases/sign_in_with_google.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:calentre/features/events/data/data_sources/event_service.dart';
import 'package:calentre/features/events/data/repository/event_repository_impl.dart';
import 'package:calentre/features/events/domain/reporsitory/event_repository.dart';
import 'package:calentre/features/events/domain/usecases/event_usecase.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_bloc.dart';
import 'package:calentre/utils/initializers.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/data/models/user_model.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Auth Singletons
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<RemoteURLs>(RemoteURLs());
  sl.registerSingleton<SupabaseClient>(Supabase.instance.client);
  sl.registerSingleton<AuthService>(AuthService(
    sl(),
  ));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<SignInWithGoogleUseCase>(SignInWithGoogleUseCase(sl()));
  sl.registerSingleton<CalentreUser>(
      const CalentreUser(userId: '', name: '', email: ''));

  //Events Singletons
  sl.registerSingleton<EventService>(EventService(sl()));
  sl.registerSingleton<EventRepository>(EventRepositoryImpl(sl()));
  sl.registerSingleton<CreateEventUsesCase>(CreateEventUsesCase(sl()));
  sl.registerSingleton<CalentreEventBloc>(CalentreEventBloc());
  sl.registerSingleton<TimeDropDownBloc>(TimeDropDownBloc());

  //Factory
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));

  //Non DI
  subscribeToAuthStateChange(sl<AuthBloc>());
}
