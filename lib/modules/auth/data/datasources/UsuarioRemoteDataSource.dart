import '../models/UsuarioModel.dart';
import 'IUsuarioDataSource.dart';

/// Implementação remota da fonte de dados (ex: API REST, GraphQL).
/// Por enquanto, implementação mock para demonstração.
class UsuarioRemoteDataSource implements IUsuarioDataSource {
  // TODO: Implementar chamadas HTTP reais quando a API estiver disponível
  // Exemplo: usar http ou dio package

  @override
  Future<UsuarioModel?> buscarPorId(String id) async {
    // TODO: Implementar chamada HTTP GET /usuarios/$id
    throw UnimplementedError('Método não implementado ainda');
  }

  @override
  Future<UsuarioModel?> buscarPorEmail(String email) async {
    // TODO: Implementar chamada HTTP GET /usuarios?email=$email
    throw UnimplementedError('Método não implementado ainda');
  }

  @override
  Future<UsuarioModel> criar(UsuarioModel usuario) async {
    // TODO: Implementar chamada HTTP POST /usuarios
    throw UnimplementedError('Método não implementado ainda');
  }

  @override
  Future<UsuarioModel> atualizar(UsuarioModel usuario) async {
    // TODO: Implementar chamada HTTP PUT /usuarios/${usuario.id}
    throw UnimplementedError('Método não implementado ainda');
  }

  @override
  Future<void> remover(String id) async {
    // TODO: Implementar chamada HTTP DELETE /usuarios/$id
    throw UnimplementedError('Método não implementado ainda');
  }

  @override
  Future<List<UsuarioModel>> listarTodos() async {
    // TODO: Implementar chamada HTTP GET /usuarios
    throw UnimplementedError('Método não implementado ainda');
  }
}
