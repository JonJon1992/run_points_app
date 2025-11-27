import '../entities/Usuario.dart';
import '../repositories/IUsuarioRepository.dart';

/// Caso de uso para buscar um usuário pelo email.
class BuscarUsuarioPorEmail {
  final IUsuarioRepository repository;

  BuscarUsuarioPorEmail(this.repository);

  Future<Usuario?> call(String email) async {
    if (email.isEmpty) {
      throw Exception('Email não pode ser vazio');
    }

    return await repository.buscarPorEmail(email);
  }
}

