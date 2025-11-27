import '../../domain/entities/Usuario.dart';
import '../../domain/repositories/IAuthRepository.dart';
import '../datasources/IAuthDataSource.dart';

/// Implementação do repositório de autenticação.
/// Responsável por converter modelos para entidades de domínio.
class AuthRepository implements IAuthRepository {
  final IAuthDataSource dataSource;

  AuthRepository({required this.dataSource});

  @override
  Future<Usuario> loginComEmailESenha(String email, String senha) async {
    final usuarioModel = await dataSource.loginComEmailESenha(email, senha);
    return usuarioModel;
  }

  @override
  Future<Usuario> loginComGoogle() async {
    final usuarioModel = await dataSource.loginComGoogle();
    return usuarioModel;
  }

  @override
  Future<Usuario> registrarComEmailESenha(
    String email,
    String senha,
    String nome,
  ) async {
    final usuarioModel = await dataSource.registrarComEmailESenha(
      email,
      senha,
      nome,
    );
    return usuarioModel;
  }

  @override
  Future<void> logout() async {
    await dataSource.logout();
  }

  @override
  Future<Usuario?> obterUsuarioAtual() async {
    final usuarioModel = await dataSource.obterUsuarioAtual();
    return usuarioModel;
  }

  @override
  Future<void> enviarEmailRedefinicaoSenha(String email) async {
    await dataSource.enviarEmailRedefinicaoSenha(email);
  }

  @override
  Future<void> atualizarSenha(String senhaAtual, String novaSenha) async {
    await dataSource.atualizarSenha(senhaAtual, novaSenha);
  }
}
