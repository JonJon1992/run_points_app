import '../entities/Usuario.dart';
import '../repositories/IAuthRepository.dart';

/// Caso de uso para realizar login com email e senha.
class LoginComEmailESenha {
  final IAuthRepository repository;

  LoginComEmailESenha(this.repository);

  Future<Usuario> call(String email, String senha) async {
    if (email.isEmpty) {
      throw Exception('Email não pode ser vazio');
    }
    if (senha.isEmpty) {
      throw Exception('Senha não pode ser vazia');
    }
    if (!email.contains('@')) {
      throw Exception('Email inválido');
    }
    if (senha.length < 6) {
      throw Exception('Senha deve ter pelo menos 6 caracteres');
    }

    return await repository.loginComEmailESenha(email, senha);
  }
}
