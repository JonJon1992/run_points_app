import '../entities/Usuario.dart';
import '../repositories/IAuthRepository.dart';

/// Caso de uso para obter o usuário autenticado atual.
class ObterUsuarioAtual {
  final IAuthRepository repository;

  ObterUsuarioAtual(this.repository);

  Future<Usuario?> call() async {
    return await repository.obterUsuarioAtual();
  }
}
