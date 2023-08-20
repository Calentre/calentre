import 'package:bloc_test/bloc_test.dart';
import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';
import 'package:calentre/features/auth/domain/usescases/sign_in_with_google.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_events.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

DataState<bool, Exception>? authResponse;

class SignInWithGoogleUseCaseMock extends Mock
    implements SignInWithGoogleUseCase {
  @override
  Future<DataState<bool, Exception>> call({void param}) async {
    return authResponse!;
  }
}

// class AuthRepositoryMock extends Mock implements AuthRepository {
//   @override  Future<DataState<bool, Exception>> signInWithGoogle() async {
//     return  authResponse!;
//   }
// }

void main() {
  final sl = GetIt.instance;

  setUpAll(() {
    sl.registerSingleton<SignInWithGoogleUseCaseMock>(
        SignInWithGoogleUseCaseMock());
  });
  group('Authentication Bloc Test', () {
    AuthBloc authBloc() => AuthBloc(sl<SignInWithGoogleUseCaseMock>());

    test(
        "// AuthBloc should return UserSignInInitialState() class as initial state",
        () {
      expect(authBloc().state, (const UserSignInInitialState()));
    });

    blocTest(
      "// SignInWithGoogleEvent() should return UserSignInLoading()",
      setUp: () => authResponse = DataFailure(Exception("It is what it is")),
      build: () => authBloc(),
      act: (authBloc) {
        authBloc.add(SignInWithGoogleEvent());
      },
      expect: () => [const UserSignInLoading()],
    );
  });
}
