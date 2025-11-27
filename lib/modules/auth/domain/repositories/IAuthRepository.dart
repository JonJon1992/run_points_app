import '../entities/Usuario.dart';

/// Interface do repositório de autenticação na camada de domínio.
abstract class IAuthRepository {
  /// Realiza login com email e senha
  Future<Usuario> loginComEmailESenha(String email, String senha);

  /// Realiza login com Google
  Future<Usuario> loginComGoogle();

  /// Registra um novo usuário com email e senha
  Future<Usuario> registrarComEmailESenha(
    String email,
    String senha,
    String nome,
  );

  /// Realiza logout do usuário atual
  Future<void> logout();

  /// Verifica se há um usuário autenticado
  Future<Usuario?> obterUsuarioAtual();

  /// Envia email de redefinição de senha
  Future<void> enviarEmailRedefinicaoSenha(String email);

  /// Atualiza a senha do usuário
  Future<void> atualizarSenha(String senhaAtual, String novaSenha);
}
