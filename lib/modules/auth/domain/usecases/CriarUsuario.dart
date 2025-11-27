import '../entities/Usuario.dart';
import '../repositories/IUsuarioRepository.dart';

/// Caso de uso para criar um novo usuário.
class CriarUsuario {
  final IUsuarioRepository repository;

  CriarUsuario(this.repository);

  Future<Usuario> call(Usuario usuario) async {
    // Validações de negócio podem ser adicionadas aqui
    if (usuario.email.isEmpty) {
      throw Exception('Email não pode ser vazio');
    }
    if (usuario.nome.isEmpty) {
      throw Exception('Nome não pode ser vazio');
    }

    return await repository.criar(usuario);
  }
}
