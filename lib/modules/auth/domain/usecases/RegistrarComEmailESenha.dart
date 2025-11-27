import '../entities/Usuario.dart';
import '../repositories/IAuthRepository.dart';

/// Caso de uso para registrar um novo usuário com email e senha.
class RegistrarComEmailESenha {
  final IAuthRepository repository;

  RegistrarComEmailESenha(this.repository);

  Future<Usuario> call(String email, String senha, String nome) async {
    if (email.isEmpty) {
      throw Exception('Email não pode ser vazio');
    }
    if (senha.isEmpty) {
      throw Exception('Senha não pode ser vazia');
    }
    if (nome.isEmpty) {
      throw Exception('Nome não pode ser vazio');
    }
    if (!email.contains('@')) {
      throw Exception('Email inválido');
    }
    if (senha.length < 6) {
      throw Exception('Senha deve ter pelo menos 6 caracteres');
    }

    return await repository.registrarComEmailESenha(email, senha, nome);
  }
}
