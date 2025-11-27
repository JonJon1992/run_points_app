import '../models/UsuarioModel.dart';
import 'IUsuarioDataSource.dart';

/// Implementação local da fonte de dados (ex: SharedPreferences, Hive, SQLite).
/// Por enquanto, implementação em memória para demonstração.
class UsuarioLocalDataSource implements IUsuarioDataSource {
  final Map<String, UsuarioModel> _usuarios = {};

  @override
  Future<UsuarioModel?> buscarPorId(String id) async {
    return _usuarios[id];
  }

  @override
  Future<UsuarioModel?> buscarPorEmail(String email) async {
    try {
      return _usuarios.values.firstWhere((usuario) => usuario.email == email);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<UsuarioModel> criar(UsuarioModel usuario) async {
    final id = usuario.id ?? DateTime.now().millisecondsSinceEpoch.toString();
    final usuarioComId = usuario.copyWith(
      id: id,
      dataCadastro: DateTime.now(),
      dataAtualizacao: DateTime.now(),
    );
    _usuarios[id] = usuarioComId;
    return usuarioComId;
  }

  @override
  Future<UsuarioModel> atualizar(UsuarioModel usuario) async {
    if (usuario.id == null) {
      throw Exception('ID é obrigatório para atualização');
    }
    final usuarioAtualizado = usuario.copyWith(dataAtualizacao: DateTime.now());
    _usuarios[usuario.id!] = usuarioAtualizado;
    return usuarioAtualizado;
  }

  @override
  Future<void> remover(String id) async {
    _usuarios.remove(id);
  }

  @override
  Future<List<UsuarioModel>> listarTodos() async {
    return _usuarios.values.toList();
  }
}
