import '../models/UsuarioModel.dart';

/// Interface para fonte de dados de autenticação.
abstract class IAuthDataSource {
  Future<UsuarioModel> loginComEmailESenha(String email, String senha);

  Future<UsuarioModel> loginComGoogle();

  Future<UsuarioModel> registrarComEmailESenha(
    String email,
    String senha,
    String nome,
  );

  Future<void> logout();

  Future<UsuarioModel?> obterUsuarioAtual();

  Future<void> enviarEmailRedefinicaoSenha(String email);

  Future<void> atualizarSenha(String senhaAtual, String novaSenha);
}
