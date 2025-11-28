import '../../domain/entities/Usuario.dart';
import '../../domain/repositories/IUsuarioRepository.dart';
import '../datasources/IUsuarioDataSource.dart';
import '../models/UsuarioModel.dart';

/// Implementação do repositório de usuários.
/// Responsável por orquestrar as fontes de dados (local e remoto)
/// e converter modelos para entidades de domínio.
class UsuarioRepository implements IUsuarioRepository {
  final IUsuarioDataSource localDataSource;
  final IUsuarioDataSource remoteDataSource;

  UsuarioRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Usuario?> buscarPorId(String id) async {
    try {
      // Tenta buscar primeiro no cache local
      final usuarioLocal = await localDataSource.buscarPorId(id);
      if (usuarioLocal != null) {
        return usuarioLocal;
      }

      // Se não encontrar localmente, busca no servidor
      final usuarioRemoto = await remoteDataSource.buscarPorId(id);
      if (usuarioRemoto != null) {
        // Salva no cache local
        await localDataSource.criar(usuarioRemoto);
        return usuarioRemoto;
      }

      return null;
    } catch (e) {
      // Em caso de erro na API, tenta buscar localmente
      return await localDataSource.buscarPorId(id);
    }
  }

  @override
  Future<Usuario?> buscarPorEmail(String email) async {
    try {
      // Tenta buscar primeiro no cache local
      final usuarioLocal = await localDataSource.buscarPorEmail(email);
      if (usuarioLocal != null) {
        return usuarioLocal;
      }

      // Se não encontrar localmente, busca no servidor
      final usuarioRemoto = await remoteDataSource.buscarPorEmail(email);
      if (usuarioRemoto != null) {
        // Salva no cache local
        await localDataSource.criar(usuarioRemoto);
        return usuarioRemoto;
      }

      return null;
    } catch (e) {
      // Em caso de erro na API, tenta buscar localmente
      return await localDataSource.buscarPorEmail(email);
    }
  }

  @override
  Future<Usuario> criar(Usuario usuario) async {
    final usuarioModel = UsuarioModel.fromEntity(usuario);

    try {
      // Cria no servidor primeiro
      final usuarioCriado = await remoteDataSource.criar(usuarioModel);
      // Salva no cache local
      await localDataSource.criar(usuarioCriado);
      return usuarioCriado;
    } catch (e) {
      // Em caso de erro, salva apenas localmente (modo offline)
      return await localDataSource.criar(usuarioModel);
    }
  }

  @override
  Future<Usuario> atualizar(Usuario usuario) async {
    final usuarioModel = UsuarioModel.fromEntity(usuario);

    try {
      // Atualiza no servidor primeiro
      final usuarioAtualizado = await remoteDataSource.atualizar(usuarioModel);
      // Atualiza no cache local
      await localDataSource.atualizar(usuarioAtualizado);
      return usuarioAtualizado;
    } catch (e) {
      // Em caso de erro, atualiza apenas localmente (modo offline)
      return await localDataSource.atualizar(usuarioModel);
    }
  }

  @override
  Future<void> remover(String id) async {
    try {
      // Remove do servidor primeiro
      await remoteDataSource.remover(id);
      // Remove do cache local
      await localDataSource.remover(id);
    } catch (e) {
      // Em caso de erro, remove apenas localmente
      await localDataSource.remover(id);
    }
  }

  @override
  Future<List<Usuario>> listarTodos() async {
    try {
      // Busca do servidor
      final usuariosRemotos = await remoteDataSource.listarTodos();
      // Atualiza cache local
      for (final usuario in usuariosRemotos) {
        await localDataSource.criar(usuario);
      }
      return usuariosRemotos;
    } catch (e) {
      // Em caso de erro, retorna dados locais
      return await localDataSource.listarTodos();
    }
  }
}
