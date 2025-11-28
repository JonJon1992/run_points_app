import '../models/UsuarioModel.dart';

/// Interface para fonte de dados de usuários.
/// Define os contratos para acesso aos dados (local ou remoto).
abstract class IUsuarioDataSource {
  Future<UsuarioModel?> buscarPorId(String id);

  Future<UsuarioModel?> buscarPorEmail(String email);

  Future<UsuarioModel> criar(UsuarioModel usuario);

  Future<UsuarioModel> atualizar(UsuarioModel usuario);

  Future<void> remover(String id);

  Future<List<UsuarioModel>> listarTodos();
}
