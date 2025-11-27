import '../entities/Usuario.dart';
import '../repositories/IAuthRepository.dart';

/// Caso de uso para realizar login com Google.
class LoginComGoogle {
  final IAuthRepository repository;

  LoginComGoogle(this.repository);

  Future<Usuario> call() async {
    return await repository.loginComGoogle();
  }
}

