import 'package:calentre/core/resources.dart';
import 'package:calentre/core/usecase.dart';
import 'package:calentre/features/auth/data/models/user_model.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';

class SignInWithGoogleUseCase
    implements UseCase<DataState<CalentreUser, Exception>, void> {
  final AuthRepository _authRepository;

  SignInWithGoogleUseCase(this._authRepository);

  @override
  Future<DataState<CalentreUser, Exception>> call({void param}) {
    return _authRepository.signInWithGoogle();
  }
}
