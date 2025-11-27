import '../repositories/IAuthRepository.dart';

/// Caso de uso para realizar logout do usuário.
class Logout {
  final IAuthRepository repository;

  Logout(this.repository);

  Future<void> call() async {
    return await repository.logout();
  }
}

