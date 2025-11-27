import '../repositories/IUsuarioRepository.dart';

/// Caso de uso para remover um usuário.
class RemoverUsuario {
  final IUsuarioRepository repository;

  RemoverUsuario(this.repository);

  Future<void> call(String id) async {
    if (id.isEmpty) {
      throw Exception('ID não pode ser vazio');
    }

    return await repository.remover(id);
  }
}
