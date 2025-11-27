import '../entities/Usuario.dart';
import '../repositories/IUsuarioRepository.dart';

/// Caso de uso para atualizar um usuário existente.
class AtualizarUsuario {
  final IUsuarioRepository repository;

  AtualizarUsuario(this.repository);

  Future<Usuario> call(Usuario usuario) async {
    if (usuario.id == null) {
      throw Exception('ID do usuário é obrigatório para atualização');
    }
    if (usuario.email.isEmpty) {
      throw Exception('Email não pode ser vazio');
    }
    if (usuario.nome.isEmpty) {
      throw Exception('Nome não pode ser vazio');
    }

    return await repository.atualizar(usuario);
  }
}
