import '../entities/Usuario.dart';

/// Interface do repositório de usuários na camada de domínio.
/// Define os contratos que devem ser implementados na camada de dados.
abstract class IUsuarioRepository {
  /// Busca um usuário pelo ID
  Future<Usuario?> buscarPorId(String id);

  /// Busca um usuário pelo email
  Future<Usuario?> buscarPorEmail(String email);

  /// Cria um novo usuário
  Future<Usuario> criar(Usuario usuario);

  /// Atualiza um usuário existente
  Future<Usuario> atualizar(Usuario usuario);

  /// Remove um usuário
  Future<void> remover(String id);

  /// Lista todos os usuários
  Future<List<Usuario>> listarTodos();
}
